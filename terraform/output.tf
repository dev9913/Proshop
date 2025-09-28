output "my_ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.awsEc2.public_ip
}

output "my_ec2_private_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.awsEc2.private_ip
}

output "arn" {
  value = aws_instance.testinstance.arn
}

output "private_dns" {
  description = "Private DNS of the EC2 instance"
  value       = aws_instance.awsEc2.private_dns
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.awsEc2.public_dns
}

output "key_pair_name" {
  description = "Name of the key pair used for SSH"
  value       = aws_instance.awsEc2.key_name
}
