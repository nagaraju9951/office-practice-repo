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

output "lb-EC2ID" {
  description = "Print the ID of lb Instance"
  value       = aws_instance.lb.id
}

output "lb-PrivateIP" {
  description = "Print the Private IP of lb Instance"
  value       = aws_instance.lb.private_ip
}

output "lb-PublicIP" {
  description = "Print the Public IP of lb Instance"
  value       = aws_instance.lb.public_ip
}

output "appsg-ID" {
  description = "Print the App Security Groupd ID"
  value       = aws_security_group.appsg.id
}

output "lbsg-ID" {
  description = "Print the LB Security Groupd ID"
  value       = aws_security_group.lbsg.id
}
