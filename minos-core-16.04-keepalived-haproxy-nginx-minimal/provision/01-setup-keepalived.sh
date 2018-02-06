#!/bin/sh

apt-get -y install  keepalived

cat >> /etc/sysctl.conf << E=O=F
net.ipv4.ip_nonlocal_bind=1
E=O=F
sysctl -p

cat > /etc/keepalived/keepalived.conf << E=O=F
vrrp_script chk_haproxy {               # Requires keepalived-1.1.13
        script "killall -0 haproxy"     # cheaper than pidof
        interval 2                      # check every 2 seconds
        weight 2                        # add 2 points of prio if OK
}

vrrp_instance VI_1 {
        #interface eth1  #for non systemd/udev systems or previous to systemd v197
        interface enp0s8 #https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames
        state MASTER
        virtual_router_id 51
        priority 100
        virtual_ipaddress {
            10.10.10.10
        }
        track_script {
            chk_haproxy
        }
}
E=O=F

service keepalived restart
