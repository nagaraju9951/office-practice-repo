output "webapp01-EC2ID" {
  description = "Print the ID of App Instance"
  value       = aws_instance.webapp01.id
}

output "webapp01-PrivateIP" {
  description = "Print the Private IP of App Instance"
  value       = aws_instance.webapp01.private_ip
}

output "webapp01-PublicIP" {
  description = "Print the Public IP of App Instance"
  value       = aws_instance.webapp01.public_ip
}

output "jenkins-EC2ID" {
  description = "Print the ID of jenkins Instance"
  value       = aws_instance.jenkins.id
}

output "jenkins-PrivateIP" {
  description = "Print the Private IP of jenkins Instance"
  value       = aws_instance.jenkins.private_ip
}

output "jenkins-PublicIP" {
  description = "Print the Public IP of jenkins Instance"
  value       = aws_instance.jenkins.public_ip
}

output "webappsg-ID" {
  description = "Print the App Security Groupd ID"
  value       = aws_security_group.webappsg.id
}

output "jenkinssg-ID" {
  description = "Print the jenkins Security Groupd ID"
  value       = aws_security_group.jenkinssg.id
}
