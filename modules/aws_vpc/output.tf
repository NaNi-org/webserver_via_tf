#vpc
output "aws_vpc_id" {
  description = "this is vpc_id"
  value       = aws_vpc.main_vpc.id
}

# Subnets
output "pub_web_subnets" {
  description = "List of IDs of public web subnets"
  value       = aws_subnet.public_web_subnet.*.id
}

output "prt_app_subnets" {
  description = "List of IDs of private app subnets"
  value       = aws_subnet.private_app_subnet.*.id
}


