# AWS Pem Key 
resource "aws_key_pair" "awskey" {
  key_name   = "deployer-key"
  public_key = file("terra-key.pub") 
}

# AWS Deafult Vpc 
resource "aws_default_vpc" "default" {

}

# AWS Security Group 
resource "aws_security_group" "mysecgroup" {
  name        = "securitygroup"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id
 
 # inbound rule 	
  ingress {
    description = "port 22 allow"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# inbound rule
  ingress {
    description = "allow port 443 "
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # inbound rule
  ingress {
    description = "allow port 80 "
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # inbound rule
  ingress {
    description = "allow port 9000 "
    from_port = 9000
    to_port = 9000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # inbound rule
  ingress {
    description = "allow port 8080 "
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # inbound rule
  ingress {
    description = "allow port 5000 "
    from_port = 5000
    to_port = 5000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # inbound rule
  ingress {
    description = "allow port 3000 "
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   # inbound rule
  ingress {
    description = "allow port 27017 "
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound rule 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SecGroup"
  }
}

# aws ec2 instance 
resource "aws_instance" "awsEc2" {
  ami = var.ami
  instance_type = var.instance 
  key_name = aws_key_pair.awskey.key_name
  vpc_security_group_ids = [aws_security_group.mysecgroup.id]
   
   # AWS Storege 
   root_block_device {
    volume_size = var.volume_size 
    volume_type = var.volume_type
  }
  	
  tags =  {
    Name = "${var.env}-Demo"
    Description = "Enter your instance Name ."
  }
}

