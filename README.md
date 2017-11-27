About
-----

[Vagrant](https://www.vagrantup.com/) is a tool for deploying software environments in a configurable and reproducible form. Because the VM deployment is reproducible it makes possible to have the same exact environment across multiple machines, thus eliminating the problems caused by differences in system configuration both across teams and infrastructure. With a single command, `vagrant up`, it becomes possible to deploy a whole environment in just a few minutes. This repository contain custom vagrant recipes I've been working on, feel free to take what you need.

Usage
-----

    #development
    $ cd folder #optionally read folder/README.mkd
    $ vagrant up

    #production
    $ cd folder #optionally read folder/README.mkd
    $ $EDITOR production.hosts
    # configure ssh key based authentication to production servers
    $ ansible-playbook -i production.hosts -vvvv *.yml

Dependencies
------------

- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org)
- [Ansible](https://www.ansible.com/)
