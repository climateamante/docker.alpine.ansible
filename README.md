# Docker | Alpine 3.6 | Ansible 2.4.2 | #

 > dependancies added for edge case with deploying to linode.com


### Example: ###

 - ``Docker run wants absolute paths``
 - ``docker-compose is just a stand-in for the docker-engine client``
 - Start with ``docker-compose up``
 - Otherwise use our custom bash command ``dockr`` for complex docker shortcuts



 - ansible-galaxy install -r requirements.yml
 - ansible-playbook containerized-wordpress.yml
 - ansible-playbook --private-key=~/.ssh/id_rsa playbook.yml


```bash
docker run \
-v $PWD/app:/var/www/app \
-p 80:8080 \
--name debug.ansible.dev \
-it --rm researchranks/alpine.ansible:latest /bin/ash
```


### Setting Up Ansible ###

ANSIBLE_CONFIG (an environment variable)
ansible.cfg (in the current directory)
.ansible.cfg (in the home directory)
/etc/ansible/ansible.cfg
