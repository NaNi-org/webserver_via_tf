# VPC
module "aws_vpc" {
  source = "./modules/aws_vpc"

  name           = "my-vpc"
  vpc_cidr_block = "10.0.0.0/16"

  azs                 = ["us-east-1b", "us-east-1a"]
  public_web_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_app_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_dns_hostnames           = true
  enable_dns_support             = true
  enable_classiclink             = true
  enable_classiclink_dns_support = true

  tags = {
    name = "demo-vpc"
  }
}
