About
-----

HA infraestructure based in keepalived (floating/virtual IP), haproxy (load
balancing), docker-swarm (services) and traefik (routing).

Usage
-----

    $ vagrant up

Go to:

https://traefik.example.com to see the service routing
https://monitor.example.com to see the docker swarm status
https://manager.example.com to manage  docker swarm through a UI

```
                                                                                          DOCKER SWARM
                                                       ______________________________________________________________________________
                                                      |                                                                              |
                                                      |             TRAEFIK                             SERVICES                     |
                                                      |     ______________________     __________________________________________    |
                                                      |    |                      |   |                                          |   |
                  +---------------------------+       |    |  +----------------+  |   |  +----------------+  +----------------+  |   |
               _ _|    Keepalive / HAProxy    |_ _    |    |  | Docker Manager |  |   |  | Docker Worker  |  | Docker Worker  |  |   |
              |   |     - - - - / 10.10.10.12 |   |   |    |  |  10.10.10.22   |  |   |  |  10.10.10.14   |  |  10.10.10.14   |  |   |
                  +---------------------------+       |    |  +----------------+  |   |  +----------------+  +----------------+  |   |
              |                                   |   |    |                      |   |                                          |   |
                                                  |   |    |                      |   |                                          |   |
+---------+   |   +---------------------------+__/ \__|    |  +----------------+  |   |  +----------------+  +----------------+  |   |
| Client  |___ ___|    Keepalive / HAProxy    |_______|____|  | Docker Manager |  |___|  | Docker Worker  |  | Docker Worker  |  |   |
| x.x.x.x |   |   | 10.10.10.10 / 10.10.10.11 |__   __|    |  |  10.10.10.21   |  |   |  |  10.10.10.14   |  |  10.10.10.14   |  |   |
+---------+       +---------------------------+  \ /  |    |  +----------------+  |   |  +----------------+  +----------------+  |   |
              |                                   |   |    |                      |   |                                          |   |
                                                      |    |                      |   |                                          |   |
              |                                   |   |    |                      |   |                                          |   |
                  +---------------------------+       |    |  +----------------+  |   |  +----------------+  +----------------+  |   |
              | _ |    Keepalive / HAProxy    | _ |   |    |  | Docker Manager |  |   |  | Docker Worker  |  | Docker Worker  |  |   |
                  |    - - - -  / 10.10.10.13 |       |    |  |  10.10.10.23   |  |   |  |  10.10.10.14   |  |  10.10.10.14   |  |   |
                  +---------------------------+       |    |  +----------------+  |   |  +----------------+  +----------------+  |   |
                                                      |    |______________________|   |__________________________________________|   |
                                                      |                                                                              |
                                                      |______________________________________________________________________________|
```

Additional information
----------------------

Use `ip addr | grep 10.10.10.10` on haproxy sites to find out the current node
attached to the floating ip:

    $ for node in 001 002 003; do
        vagrant ssh load-balancer.$node.example.com -c "ip addr | grep 10.10.10.10 && echo load-balancer.$node has it!"
      done

Test services using:

    $ while :; do curl --header 'Host: echo.example.com'    http://10.10.10.10; sleep 1; done
    $ while :; do curl --header 'Host: traefik.example.com' http://10.10.10.10; sleep 1; done
    $ while :; do curl --header 'Host: monitor.example.com' http://10.10.10.10; sleep 1; done
    $ while :; do curl --header 'Host: manager.example.com' http://10.10.10.10; sleep 1; done

Pro tip: use `socat` to redirect LAN traffic to your private floating ip:

    $ sudo socat TCP4-LISTEN:www,reuseaddr,fork TCP4:10.10.10.10:80

Now your LAN clients would be able to connect through http://your-host-machine-ip
