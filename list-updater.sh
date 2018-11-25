#!/bin/bash

wget -O /root/list.sh  https://raw.githubusercontent.com/DeanStern/OpenVPN-install/master/list.sh
sleep 2

yum install -y httpd
systemctl start httpd
systemctl enable httpd

chmod +x /root/list.sh

echo '*/1  *  *  *  * root  /root/list.sh' >> /etc/crontab
