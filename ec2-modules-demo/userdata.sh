#! /bin/sh

sudo yum install git -y
sudo yum install httpd -y

sudo systemctl start httpd 
sudo systemctl enable httpd

echo "<h1>User data Demo. Automatically create Static HTML page, Instance has been deployed using Terraform</h1>" | sudo tee /var/www/html/index.html

sudo yum update -y