resource "aws_alb" "this" {
  name                      = var.name
  internal                  = false
  load_balancer_type        = var.lb_type
  security_groups           = var.security_group_ids
  subnets                   = var.subnet_ids
}

resource "aws_alb_target_group" "this" {
  name                      = "${var.name}-tg"
  port                      = var.target_port
  protocol                  = var.protocol
  vpc_id                    = var.vpc_id

  health_check {
    path                    = "/"
    interval                = 30
    timeout                 = 5
    healthy_threshold       = 3
    unhealthy_threshold     = 3
    matcher                 = "200"
  } 

  tags = var.tags
}

resource "aws_alb_listener" "http" {
  load_balancer_arn         = aws_alb.this.arn
  port                      = 80
  protocol                  = var.protocol

  default_action {
    type                    = "forward"
    target_group_arn        = aws_alb_target_group.this.arn
  }
}
