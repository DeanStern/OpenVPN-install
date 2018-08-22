#!/bin/sh
rm -rf /root/openVPN-udp/*

cat /etc/openvpn/openvpn.log | grep "CLIENT_LIST,trialUser" | awk 'END{ print "$SERVER_NICK_NAME Trial",NR }' >> /root/openVPN-udp/OpenVPNUsers.log
cat /etc/openvpn/openvpn.log | grep "CLIENT_LIST,vpnuser" | awk 'END{ print "$SERVER_NICK_NAME",NR }' >> /root/openVPN-udp/OpenVPNUsers.log

cat /etc/openvpn/openvpn.log | grep "CLIENT_LIST,trialUser" | awk -F',' -v now=`date +%s` '{print "$SERVER_NICK_NAME Trial",$3,$6,$7,now-$9}' >> /root/openVPN/OpenVPN.log
cat /etc/openvpn/openvpn.log | grep "CLIENT_LIST,vpnuser" | awk -F',' -v now=`date +%s` '{print "$SERVER_NICK_NAME",$3,$6,$7,now-$9}' >> /root/openVPN/OpenVPN.log

/bin/curl -T /root/openVPN-udp/OpenVPNUsers.log http://listener.logz.io:8021/file_upload/ejNwBdrgIBaYdIxxOfigFcjfzlbnNoeD/OpenVPNConnectedUsers
/bin/curl -T /root/openVPN-udp/OpenVPN.log http://listener.logz.io:8021/file_upload/ejNwBdrgIBaYdIxxOfigFcjfzlbnNoeD/OpenVPNStats
