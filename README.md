# docker-nci-ansible-ui

This image comes compiled with [nci-ansible-ui](https://github.com/node-ci/nci-ansible-ui) for executing your Ansible playbooks in a web gui.

```bash
docker pull experium/nci-ansible-ui
```

Running the image will give you a demo configuration to play with. Simply access the host on port 3000, eg http://127.0.0.1:3000

To preserve data and your changes as well as use your own config, simply mount your `data` dir in to `/srv/nci-ansible-ui/data` in the image and you're set. See [this git repo](https://github.com/node-ci/nci-ansible-ui-quick-setup/tree/master/data) for an example of data dir and config. Note: Leave the `host` as an empty string `""` for this to work in the docker environment.

### docker-compose

```yaml
version: "3"
services:
  app:
    image: experium/nci-ansible-ui
    volumes:
       - ./data:/srv/nci-ansible-ui/data
    ports:
      - "3000:3000"
```
