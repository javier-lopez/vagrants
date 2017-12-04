About
-----

[Mongodb](https://www.mongodb.com/) 3 nodes replica set.

Usage
-----

Edit `./group_vars/all` to customize default parameters.

    #development
    $ $EDITOR ./group_vars/all
    $ vagrant up

    #production
    $ $EDITOR ./group_vars/all
    $ ansible-playbook -i production.hosts -vvvv ansible.yml

Required vagrant plugins
-----------------------------------

    1. vagrant-hostupdater, used to update /etc/hosts on the host

        $ vagrant plugin install vagrant-hostsupdater

    2. vagrant-hosts, used to update /etc/hosts between virtual machines

        $ vagrant plugin install vagrant-hosts
