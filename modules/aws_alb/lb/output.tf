output "dns_name" {
  description = "The DNS name of the load balancer."
  value = element(
    concat(
      aws_lb.application.*.dns_name,
      [""],
    ),
    0,
  )
}

output "arn" {
  description = "The ARN of the load balancer."
  value = element(
    concat(
      aws_lb.application.*.arn,
      [""],
    ),
    0,
  )
}

output "load_balancer_arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch."
  value = element(
    concat(
      aws_lb.application.*.arn_suffix,
      [""],
    ),
    0,
  )
}

output "load_balancer_id" {
  description = "The ID and ARN of the load balancer we created."
  value = element(
    concat(
      aws_lb.application.*.id,
      [""],
    ),
    0,
  )
}

output "load_balancer_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value = element(
    concat(
      aws_lb.application.*.zone_id,
      [""],
    ),
    0,
  )
}
