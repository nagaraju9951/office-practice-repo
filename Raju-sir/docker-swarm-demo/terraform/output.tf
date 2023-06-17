output "app01-EC2ID" {
  description = "Print the ID of App Instance"
  value       = aws_instance.app01.id
}

output "app01-PrivateIP" {
  description = "Print the Private IP of App Instance"
  value       = aws_instance.app01.private_ip
}

output "app01-PublicIP" {
  description = "Print the Public IP of App Instance"
  value       = aws_instance.app01.public_ip
}

output "app02-EC2ID" {
  description = "Print the ID of App Instance"
  value       = aws_instance.app02.id
}

output "app02-PrivateIP" {
  description = "Print the Private IP of App Instance"
  value       = aws_instance.app02.private_ip
}

output "app02-PublicIP" {
  description = "Print the Public IP of App Instance"
  value       = aws_instance.app02.public_ip
}

output "master-EC2ID" {
  description = "Print the ID of lb Instance"
  value       = aws_instance.master.id
}

output "master-PrivateIP" {
  description = "Print the Private IP of lb Instance"
  value       = aws_instance.master.private_ip
}

output "master-PublicIP" {
  description = "Print the Public IP of lb Instance"
  value       = aws_instance.master.public_ip
}

output "appsg-ID" {
  description = "Print the App Security Groupd ID"
  value       = aws_security_group.appsg.id
}
