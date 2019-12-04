#!/bin/sh
#WANIP=52.47.209.216
echo "address=/.testing/$WANIP" > /etc/dnsmasq.d/wan.conf
echo "address=/.awesome/$WANIP" >> /etc/dnsmasq.d/wan.conf

echo "search reddog.microsoft.com" > /etc/resolv.conf
echo "nameserver 127.0.0.1" >> /etc/resolv.conf

/usr/sbin/dnsmasq -d --no-resolv --keep-in-foreground --no-hosts --bind-interfaces --pid-file=/var/run/dnsmasqwan.pid --listen-address=127.0.0.1 --cache-size=400 --clear-on-reload --conf-file=/etc/dnsmasq.d/wan.conf --proxy-dnssec &
/usr/sbin/squid -NYCd 1 &
sleep 3
tail -f /var/log/squid/access.log
