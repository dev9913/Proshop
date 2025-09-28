resource "local_file" "ansible_inventory" {
  content = <<EOT
[web]
${aws_instance.awsEc2.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=${path.module}/terra-key
EOT

  filename = "${path.module}/../ansible/inventory.ini"
}
