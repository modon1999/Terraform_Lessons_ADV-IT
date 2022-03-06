#!bin/bash
yum -y update
yum -y install httpd
PrivateIP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
echo "<html><body bgcolor=black><center><h2><p><font color=red>Web Server with: $PrivateIP Build by Terraform! Using External Script! Version 3.0</h2></center></body></html>" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
