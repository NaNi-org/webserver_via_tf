#Module      : EC2 webserver
#Description : Terraform module to create an EC2 resource on AWS.
module "aws_ec2_web_server" {
  source = "./modules/aws_ec2"
  name                        = "web_server"
  ami                         = "ami-09e67e426f25ce0d7" 
  instance_count              = 1
  instance_type               = "t3.small"
  key_name                    = "webserverkey"
  vpc_security_group_ids      = [module.mi-sg.security_group_id]
  subnet_id                   = module.aws_vpc.pub_web_subnets[0]
  user_data                   = file("./install_apache.sh")
  associate_public_ip_address = true

  root_block_device = [
    {
      volume_type           = "gp2"
      volume_size           = 16
      delete_on_termination = true
    }
  ]

  tags = {
    name = "webserver"
  }
}
