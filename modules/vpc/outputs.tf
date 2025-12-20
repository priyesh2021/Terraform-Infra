output "vpc_id" {
    value   = aws_vpc.this.id
}

output "public_subnet_ids" {
    value   = aws_subnet.public[*].id
}

output "private_subnet_ids" {
    value   = aws_subnet.private[*].id
}

output "nat_eip_public_ip" {
  description = "Public IP address of the NAT Gateway Elastic IP"
  value       = aws_eip.nat.public_ip
}