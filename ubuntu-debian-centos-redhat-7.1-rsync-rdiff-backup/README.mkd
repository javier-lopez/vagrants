About
-----

Simple backup solution based on tar|rsync|rdiff|cron. Tested in Ubuntu|Debian|Centos|RedHat

Usage
-----

Edit `./group_vars/all` to customize default parameters.

    #development
    $ $EDITOR ./group_vars/all
    $ vagrant up

    #production
    $ $EDITOR ./production.hosts
    $ ansible-playbook -i production.hosts -vvvv ansible.yml
