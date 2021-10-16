  
## Create application Load balancer for web servers
module "mi-ws-alb" {
  source             = "./modules/aws_alb/lb"
  load_balancer_type = "application"
  load_balancer_name = "my-app-lb"
  subnets            = module.aws_vpc.pub_web_subnets
  internal           = false
  security_groups    = [module.mi-sg.security_group_id]

  idle_timeout                     = 150
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false
  vpc_id                           = module.aws_vpc.aws_vpc_id
 

  tags = {
    cluster-name = "alb"
  }
}


# Target groups #
module "my_tg" {
  source       = "./modules/aws_alb/target_group"
  name         = "mytg"
  backend_port = 80
  vpc_id       = module.aws_vpc.aws_vpc_id
  target_type  = "instance"

  health_check = {
    interval          = "30",
    healthy_threshold = 5
    unhealthy_threshold = 5 
    matcher           = 200
    timeout           = 5
  }
  
  targets                = module.aws_ec2_web_server.id[0]
  target_attachemnt_port = 80

}

module "mi-ws-listeners-http" {
  source            = "./modules/aws_alb/listeners"
  load_balancer_arn = module.mi-ws-alb.arn
  listener_type     = "static"

  static_listeners = {
    port             = "80"
    protocol         = "HTTP"
    target_group_arn = module.my_tg.target_group_arn
  }
}

