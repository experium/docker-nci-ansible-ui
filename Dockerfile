FROM node:8.12-stretch

RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
RUN apt-get -y update && \
    apt-get -t stretch-backports install -y ansible && \
    apt-get clean

RUN git clone https://github.com/node-ci/nci-ansible-ui-quick-setup /srv/nci-ansible-ui && \
    cd /srv/nci-ansible-ui && \
    npm install && \
    sed -i -e 's/host: 127.0.0.1/host: ""/g' data/config.yaml

COPY index.html /srv/nci-ansible-ui/node_modules/nci-ansible-ui/static/index.html

WORKDIR /srv/nci-ansible-ui

EXPOSE 3000

CMD [ "node_modules/.bin/nci" ]
