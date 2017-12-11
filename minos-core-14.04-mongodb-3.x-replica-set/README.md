About
-----

[Mongodb](https://www.mongodb.com/) 3 nodes replica set.

Usage
-----

Edit `./provision/group_vars/all` to customize default parameters.

    #development
    $ $EDITOR ./provision/group_vars/all
    $ vagrant up

    #production
    $ $EDITOR ./provision/group_vars/all
    $ ansible-playbook -i provision/production.hosts -vvvv provision/ansible.yml

Required vagrant plugins
------------------------

    1. vagrant-hostmanager used to update /etc/hosts on the host/guests machines

        $ vagrant plugin install vagrant-hostmanager
