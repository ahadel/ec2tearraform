#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
echo "<h1> Hello Automation Hero </h1>" | sudo tee /var/www/html/index.html