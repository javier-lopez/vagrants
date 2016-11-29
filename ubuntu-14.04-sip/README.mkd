About
-----

Sip client on X less, audioless server, automatizate calls.

Usage
-----

Edit `./group_vars/all` to customize default parameters.

    #development
    $ $EDITOR ./group_vars/all
    $ vagrant up

    #production
    $ ansible-playbook -i production.hosts -vvvv ansible.yml

The 'sip' user is required to login at the specified date on the configured server to avoid generating alerts
