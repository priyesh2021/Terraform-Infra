module "qa_nlb_sg" {
  source = "../../modules/sg"

  name   = "qa-nlb-sg"
  vpc_id = module.vpc.vpc_id

  ingress_rule = [
    {
      from_port  = 12246
      to_port    = 12246
      protocol   = "tcp"
      cidr_block = ["0.0.0.0/0"]
    }
  ]
  tags = var.tags
}


module "qa_nlb" {
  source = "../../modules/alb"

  name               = "qa-nlb"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.qa_nlb_sg.security_group_id]
  lb_type            = "network"
  target_port        = 12246
  protocol           = "TCP"
  tags               = var.tags
}

resource "aws_lb_target_group_attachment" "nlb_private_ec2" {
  target_group_arn = module.qa_alb.target_group_arn
  target_id        = module.qa_private_ec2.instance_id
  port             = 12246
}
