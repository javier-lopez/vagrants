About
-----

pam-tally2 on Centos/Redhat 6/7, block access to system user accounts by number of tries.

Usage
-----

Edit `./group_vars/all` to customize default parameters.

    #development
    $ $EDITOR ./group_vars/all
    $ vagrant up
    $ ssh tally@localhost -p 2222 #fail 3 times
    $ ssh tally@localhost -p 2222 #pam-tally2 will block access to the system for 10 minutes

    #production
    $ $EDITOR ./group_vars/all
    $ $EDITOR ./production.hosts
    $ ansible-playbook -i production.hosts -vvvv ansible.yml
    $ ssh tally@localhost -p 2222 #fail 3 times
    $ ssh tally@localhost -p 2222 #pam-tally2 will block access to the system for 10 minutes
