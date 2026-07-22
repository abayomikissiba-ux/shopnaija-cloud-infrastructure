#!/bin/bash

# Update system
dnf update -y

# Install Apache
dnf install -y httpd

# Enable Apache
systemctl enable httpd
systemctl start httpd

# Create a simple homepage
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>ShopNaija</title>
</head>
<body style="font-family: Arial; text-align:center; margin-top:100px;">
    <h1>Welcome to ShopNaija</h1>
    <h2>Application deployed successfully!</h2>
    <p>Served from EC2 Instance</p>
</body>
</html>
EOF