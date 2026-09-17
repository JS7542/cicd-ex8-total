output "key_name" {
  value = var.ssh_public_key_path
}

output "web_instance_private_ip" {
  value = aws_instance.std20_web_instance.private_ip
}

