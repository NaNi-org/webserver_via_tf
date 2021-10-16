#! /bin/bash
sudo apt-get update -y
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
echo "<h1> Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html