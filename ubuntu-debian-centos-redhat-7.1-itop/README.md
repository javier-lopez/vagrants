About
-----

[itop](http://www.combodo.com/itop) is an open source ITIL ITSM CMDB software, this recipe deploys itop on Ubuntu|Ubuntu|Debian|Centos 7|RedHat 7 with Apache and MariaDB.

Usage
-----

Edit `./group_vars/all` to customize default parameters.

    #development
    $ $EDITOR ./group_vars/all
    $ vagrant up
    $ #open http://itop.example.com/setup to finish the instalation/update procedure

    #production
    $ $EDITOR ./group_vars/all
    $ ansible-playbook -i production.hosts -vvvv ansible.yml
    $ #open http://itop.example.com/setup to finish the instalation/update procedure
