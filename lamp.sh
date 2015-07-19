#!/bin/bash
# Shell script to install LAMP with dependencies for running PHP apps for ubuntu 14.04 or above
# ---------------------------------------------------------------------------------------------
# Copyright (c) 2015 Fejjari Semah <http://www.s3mah-f3jjari.cf>
# This script is licensed under GNU GPL version 3.0 or above
# ---------------------------------------------------------------------------------------------

echo "Welcome this is the install of LAMP (Linux Apache Mysql Php) it is to easy "
while read -p "would you Continue (y/n)?" choice  
do
case "$choice" in 
  
    n|N)  
 echo "Good Bye"
exit;;
  y|Y ) 
 if ! which apache2 >/dev/null; then

 echo " installing Apache " 
 sudo apt-get install apache2 -y 
 sleep 1
 echo "Add server name to Apache config"
 sudo sh -c 'echo "ServerName localhost" >> /etc/apache2/apache2.conf'
 sleep 1
 elif ! which mysql >/dev/null; then 
 echo "Apache exists Moving to install mysql and dependencies  "
 sleep 1
 

 sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql -y

 elif ! which php5 >/dev/null; then 
 echo "Mysql exists  Moving to install php"
 sleep 1



 sudo apt-get install php5 	 php5-mcrypt php5-gd -y

 sleep 1
 echo " If you need other php modules just look them up using: apt-cache search php5-
 To install a php module just use the command : sudo apt-get install php5-module_name"
 sleep 1 
 echo "Congratulations now you had a LAMP server in your local machine "

 else 
	echo "are u kidding me you have LAMP in your pc"
	exit
 fi;;

   * ) echo "you should write n or y ";;
 
 esac
done