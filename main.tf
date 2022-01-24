provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

resource "tls_private_key" "webserverkey" {
  algorithm = "RSA"
}
resource "aws_key_pair" "generated_key" {
  key_name   = "webserverkey"
  public_key = tls_private_key.webserverkey.public_key_openssh
  depends_on = [
    tls_private_key.webserverkey
  ]
}
resource "local_file" "key" {
  content         = tls_private_key.webserverkey.private_key_pem
  filename        = "webserverkey.pem"
  file_permission = "0400"
  depends_on = [
    tls_private_key.webserverkey
  ]
}


resource "aws_security_group" "firewall" {
  name        = "herofirewall"
  description = "firewall allows SSH and HTTP "

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "herofirewall"
    Terraform = "true"
    env       = var.environment
  }
}


resource "aws_instance" "webserver" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated_key.key_name
  vpc_security_group_ids      = ["${aws_security_group.firewall.name}"]

  user_data = file("httpd.sh")

  tags = {
    Name      = var.name
    Terraform = "true"
    env       = var.environment
  }
}

output "webserverIP" {
  value = aws_instance.webserver.public_ip
} 
