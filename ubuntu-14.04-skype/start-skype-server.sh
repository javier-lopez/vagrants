#!/bin/bash
#
# Control skype and related services.
#
# This script is not multi-user safe... use for single UNIX user "skype" server deployments only.

DAEMON_USER=skype
XSERVERNUM=1

export DISPLAY=:$XSERVERNUM

# Which services we are
services="$SERVICES"
if [[ -z "$services" ]]
then
    services="xvfb fluxbox skype"
fi

start() {


    if [[ $services == *xvfb* ]]
    then
        if [[ `ps aux | grep "$DAEMON_USER" | grep "Xvfb :$XSERVERNUM" | grep -v grep | wc -l` == '0' ]]; then
                echo "starting Xvfb"
                Xvfb :$XSERVERNUM -screen 0 800x600x16 &
        else
                echo "Xvfb already running"
        fi
    fi

    if [[ $services == *fluxbox* ]]
    then
        if [[ `ps aux | grep "$DAEMON_USER" | grep "fluxbox" | grep -v grep | wc -l` == '0' ]]; then
                echo "starting fluxbox"
                sleep 3
                fluxbox &
        else
                echo "fluxbox already running"
        fi
    fi

    if [[ $services == *skype* ]]
    then
        pgrep skype > /dev/null
        if [[ $? != '0' ]]; then
            sleep 3
            skype &
            #apulse "$(command -v "skype")" &
        else
            echo "skype already running"
        fi
    fi
}

stop() {

    if [[ $services == *skype* ]]
    then
        pgrep skype > /dev/null
        if [[ $? != '0' ]]; then
            echo "skype is NOT running"
        else
            echo "killing skype"
            killall skype apulse
        fi
    fi

    if [[ $services == *fluxbox* ]]
    then
        if [[ `ps aux | grep "$DAEMON_USER" | grep "fluxbox" | grep -v grep | wc -l` == '0' ]]; then
            echo "fluxbox is NOT running"
        else
            echo "Killing fluxbox"
            killall fluxbox
            sleep 3
            killall -SIGKILL fluxbox
        fi
    fi


    if [[ $services == *xvfb* ]]
        then
        if [[ `ps aux | grep skype | grep "Xvfb :$XSERVERNUM" | grep -v grep | wc -l` == '0' ]]; then
            echo "Xvfb is NOT running"
        else
            echo "Killing Xvfb"
            killall Xvfb
        fi
    fi
}

status() {

    i='3'


    if [[ $services == *xvfb* ]]
    then
        if [[ `ps aux | grep "$DAEMON_USER" | grep "Xvfb :$XSERVERNUM" | grep -v grep | wc -l` == '0' ]]; then
            echo "Xvfb is NOT running"
        else
            echo "Xvfb is running"
            ((i--))
        fi
    else
        ((i--))
    fi

    if [[ $services == *fluxbox* ]]
    then
        if [[ `ps aux | grep "$DAEMON_USER" | grep "fluxbox" | grep -v grep | wc -l` == '0' ]]; then
            echo "fluxbox is NOT running"
        else
            echo "fluxbox is running"
            ((i--))
        fi
    else
        ((i--))
    fi

    if [[ $services == *skype* ]]
    then
        pgrep skype > /dev/null
        if [[ $? != '0' ]]; then
            echo "skype is NOT running"
        else
            echo "skype is running"
            ((i--))
        fi
    else
        ((i--))
    fi

    if [[ "$i" == '0' ]]; then
        echo "OVERALL STATUS: OK"
        exit 0
    fi
    if [[ "$i" == '1' || "$i" == '2' ]]; then
        echo "OVERALL STATUS: NOT RUNNING PROPERLY"

    else
        echo "OVERALL STATUS: NOT RUNNING"
    fi
    exit "$i"
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    status)
        status
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
esac
