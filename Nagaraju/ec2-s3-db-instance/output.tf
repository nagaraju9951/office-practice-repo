
output "save-tf_id" {
  description = "Print the ID of EC2 Instance"
  value       = aws_instance.save-tf.id
}

output "save-tf_private_ip" {
  description = "Print the Private IP of EC2 Instance"
  value       = aws_instance.save-tf.private_ip
}

output "save-tf_public_ip" {
  description = "Print the Public IP of EC2 Instance"
  value       = aws_instance.save-tf.public_ip
}