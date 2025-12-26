module "qa_asg" {
  source = "../../modules/asg"

  name      = "qa_asg"
  ami_id    = var.ami_id

  instance_types = [ 
    "t2.micro",
    "t2.small",
    "t3.micro"
   ]

  subnet_ids = module.vpc.private_subnet_ids

  security_group_ids = [
    module.qa_ec2_sg.security_group_id
  ]

  desired_capacity  = 2
  min_capacity      = 2
  max_capacity   = 4

  on_demand_percentage = 10
  
  target_group_arns = [
    module.qa_alb.target_group_arn
  ]

  tags = var.tags
}