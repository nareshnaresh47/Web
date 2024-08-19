provider "aws" {
    region     = "ap-southeast-1"
 }

 resource "aws_instance" "example" {
   ami           = "ami-0a6b545f62129c495"
   instance_type = "t2.micro"
   key_name = "nginx"
   count="2"


user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo “Hello World from $(hostname -f)” > /var/www/html/index.html
yum install git -y
yum install maven -y
EOF

 }