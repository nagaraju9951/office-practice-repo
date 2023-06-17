output "test_ec201-EC2ID" {
  description = "Print the ID of App Instance"
  value       = aws_instance.test_ec201.id
}

output "test_ec201-PrivateIP" {
  description = "Print the Private IP of App Instance"
  value       = aws_instance.test_ec201.private_ip
}

output "test_ec201-PublicIP" {
  description = "Print the Public IP of App Instance"
  value       = aws_instance.test_ec201.public_ip
}
