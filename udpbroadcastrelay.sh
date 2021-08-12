# Sonos
#
# /usr/local/etc/rc.d/udpbroadcastrelay.sh
# Script to run udpbroadcastrelay on startup
# https://forum.opnsense.org/index.php?topic=16769.msg76482#msg76482
# https://forum.netgate.com/topic/155698/how-can-i-get-this-udp-relay-package-for-casting-across-vlans/37

#!/bin/sh
rc_start() {

    /usr/bin/nohup /usr/local/sbin/udpbroadcastrelay --id 1 --port 5353 --dev igb1 --dev igb2.20 --multicast 224.0.0.251 -s 1.1.1.1 -f > /dev/null
    /usr/bin/nohup /usr/local/sbin/udpbroadcastrelay --id 2 --port 1900 --dev igb1 --dev igb2.20 --multicast 239.255.255.250 -s 1.1.1.1 -f > /dev/null
    /usr/bin/nohup /usr/local/sbin/udpbroadcastrelay --id 3 --port 6969 --dev igb1 --dev igb2.20 --multicast 239.255.255.250 -f > /dev/null


    /usr/bin/nohup /usr/local/sbin/udpbroadcastrelay --id 4 --port 5353 --dev igb1 --dev igb2 --multicast 224.0.0.251 -s 1.1.1.1 -f > /dev/null
    /usr/bin/nohup /usr/local/sbin/udpbroadcastrelay --id 5 --port 1900 --dev igb1 --dev igb2 --multicast 239.255.255.250 -s 1.1.1.1 -f > /dev/null
    /usr/bin/nohup /usr/local/sbin/udpbroadcastrelay --id 6 --port 6969 --dev igb1 --dev igb2 --multicast 239.255.255.250 -f > /dev/null

}

rc_stop() {
    /usr/bin/killall -q /usr/local/sbin/udpbroadcastrelay
}

case $1 in
        start)
                rc_start
                ;;
        stop)
                rc_stop
                ;;
        restart)
                rc_stop
                rc_start
                ;;
esac

