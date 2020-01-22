FROM node:8.17.0-buster

RUN echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list.d/ansible.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt -y update && \
    apt install -y ansible && \
    apt clean

RUN git clone https://github.com/node-ci/nci-ansible-ui-quick-setup /srv/nci-ansible-ui && \
    cd /srv/nci-ansible-ui && \
    npm install && \
    sed -i -e 's/host: 127.0.0.1/host: ""/g' data/config.yaml

COPY index.html /srv/nci-ansible-ui/node_modules/nci-ansible-ui/static/index.html

WORKDIR /srv/nci-ansible-ui

EXPOSE 3000

CMD [ "node_modules/.bin/nci" ]
