# key pair
resource "aws_key_pair" "my-aws-key" {
  key_name   = "terra-key"
  public_key = file("terra-key-ec2.pub")
}

# VPC & Security
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource aws_security_group mysecuritygrp {
    name = var.security_groups_name
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id = aws_default_vpc.default.Name
    
    # inbound ---ingress
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH-port-open"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP port open"
    }
    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "3000 port open"
    }
    ingress {
        from_port = 5000
        to_port = 5000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "5000 port open"
    }
    ingress {
        from_port = 5432
        to_port = 5432
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "5432 port open"
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all access "
    }
    tags = {
        Name = "allow_tls"
        }   
}

# ec2 instance
resource aws_instance "my_instance" {
    key_name = aws_key_pair.my-aws-key.key_name
    security_groups = [aws_security_group.mysecuritygrp.name]
    instance_type = var.ec2_instance-type
    ami = var.ec2_ami
    root_block_device {
      volume_size = var.ec2_root_storage_size
      volume_type = "gp3"
    }
    tags = {
        Name = var.ec2_instance_name
    }

}
  