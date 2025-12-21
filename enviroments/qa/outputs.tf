output "qa_nat_eip_public_ip" {
  description = "NAT Gateway Elastic IP for QA"
  value       = module.vpc.nat_eip_public_ip
}
output "qa_public_ec2_private_ip" {
  description = "Private IP of QA public EC2 instance"
  value       = module.qa_public_ec2.private_ip
}

output "qa_private_ec2_private_ip" {
  description = "Private IP of QA private EC2 instance"
  value       = module.qa_private_ec2.private_ip
}
output "qa_public_ec2_public_ip" {
  description = "Public IP of QA public EC2 instance"
  value       = module.qa_public_ec2.public_ip
}
