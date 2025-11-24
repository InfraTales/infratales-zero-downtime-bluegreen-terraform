module "networking" {
  source      = "./networking"
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}

module "loadbalancer" {
  source             = "./loadbalancer"
  vpc_id             = module.networking.vpc_id
  public_subnets     = module.networking.public_subnet_ids
  security_groups    = [module.networking.alb_sg_id]
  blue_target_group  = "" # Not needed as input anymore, created internally
  green_target_group = "" # Not needed
  traffic_weight     = var.traffic_distribution
}

module "blue" {
  source           = "./blue"
  vpc_id           = module.networking.vpc_id
  private_subnets  = module.networking.private_subnet_ids
  instance_type    = var.instance_type
  capacity         = var.blue_capacity
  alb_sg_id        = module.networking.alb_sg_id
  target_group_arn = module.loadbalancer.blue_tg_arn
}

module "green" {
  source           = "./green"
  vpc_id           = module.networking.vpc_id
  private_subnets  = module.networking.private_subnet_ids
  instance_type    = var.instance_type
  capacity         = var.green_capacity
  alb_sg_id        = module.networking.alb_sg_id
  target_group_arn = module.loadbalancer.green_tg_arn
}

module "monitoring" {
  source         = "./monitoring"
  alb_arn_suffix = module.loadbalancer.alb_arn_suffix
}

module "cicd" {
  source = "./cicd"
  # Add inputs if needed
}
