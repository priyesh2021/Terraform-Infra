## SG Block

module "qa_alb_sg" {
  source = "../../modules/sg"

  name   = "qa-alb-sg"
  vpc_id = module.vpc.vpc_id

  ingress_rule = [
    {
      from_port  = 80
      to_port    = 80
      protocol   = "tcp"
      cidr_block = ["0.0.0.0/0"]
    }
  ]

  tags = var.tags
}

module "qa_alb" {
  source = "../../modules/alb"

  name               = "qa-alb"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.qa_alb_sg.security_group_id]
  tags               = var.tags
}

resource "aws_lb_target_group_attachment" "private_ec2" {
  target_group_arn = module.qa_alb.target_group_arn
  target_id        = module.qa_private_ec2.instance_id
  port             = 80
}
