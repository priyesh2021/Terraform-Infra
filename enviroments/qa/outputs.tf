output "qa_nat_eip_public_ip" {
  description = "NAT Gateway Elastic IP for QA"
  value       = module.vpc.nat_eip_public_ip
}
