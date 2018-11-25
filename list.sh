#!/bin/sh

udp=$(cat /etc/openvpn/openvpn.log | grep "CLIENT_LIST" | awk 'END{ print NR }')
tcp=$(cat /etc/openvpn/openvpn-tcp.log | grep "CLIENT_LIST" | awk 'END{ print NR }')

total=$(expr $udp + $tcp)
echo $total > /var/www/html/index.html
