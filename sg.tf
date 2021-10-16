
module "mi-sg" {
  source      = "./modules/aws_sg"
  name        = "web_security-group"
  description = "web_security-group"
  vpc_id      = module.aws_vpc.aws_vpc_id

  # Ingress rules #
  ingress_with_self = [
    {
      description = "this is self security group"
      from_port   = "0"
      to_port     = "0"
      protocol    = "-1"
    }
  ]

  ingress_with_cidr_blocks = [
    {
      description = "ssh"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "httd"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["157.48.161.32/32"]
      ipv6_cidr_blocks = ["::/0"]
    },
    {
      description = "All"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = ["157.48.161.32/32"]
    },
  ]

  # Egress rules #
  egress_with_cidr_blocks = [
    {
      from_port   = "0"
      to_port     = "0"
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
