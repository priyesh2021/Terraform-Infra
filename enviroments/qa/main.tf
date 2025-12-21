module "vpc" {
  source = "../../modules/vpc/"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  tags            = var.tags
}

# Security Group
module "qa_ec2_sg" {
  source = "../../modules/sg"

  name          = qa_ec2_sg
  vpc_id        = module.vpc.vpc_id

  ingress_rule = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_block  = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "http"
      cidr_block  = ["0.0.0.0/0"] 
    }
  ]

  tags = var.tags
}

# EC2
module "qa_public_ec2" {
  source = "../../modules/ec2"

  name                    = "qa_public_ec2"
  ami_id                  = var.ami_id
  instance_type           = var.public_instance_type
  subnet_id               = module.vpc.public_subnet_ids[0]
  security_group_id       = [module.qa_ec2_sg.security_group_id]
  associate_public_ip     = true
  tags                    = var.tags
}

module "qa_private_ec2" {
  source = "../../modules/ec2"

  name                     = "qa_private_ec2"
  ami_id                 = var.ami_id
  instance_type            = var.public_instance_type
  subnet_id                = module.vpc.private_subnet_ids[0]
  security_group_id        = [module.qa_ec2_sg.security_group_id]
  associate_public_ip      = false
  tags                     = var.tags
}