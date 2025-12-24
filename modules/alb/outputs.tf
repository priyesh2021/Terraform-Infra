output "alb_dns_name" {
  value = aws_alb.this.dns_name
}
output "target_group_arn" {
  value = aws_alb_target_group.this.arn
}