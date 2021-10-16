output "target_group_arn" {
  description = "ARN of the target groups. Useful for passing to your Auto Scaling group."
  value = element(
    concat(
      aws_lb_target_group.my_tg.*.arn,
      [""],
    ),
    0,
  )
}

output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = aws_lb_target_group.my_tg.*.name
}
