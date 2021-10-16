resource "aws_lb_target_group" "my_tg" {
  name        = var.name
  vpc_id      = var.vpc_id
  port        = var.backend_port
  protocol    = var.backend_protocol != null ? upper(var.backend_protocol) : null
  target_type = var.target_type

  dynamic "health_check" {
    for_each = length(keys(var.health_check)) == 0 ? [] : [var.health_check]

    content {
      enabled             = lookup(health_check.value, "enabled", true)
      interval            = lookup(health_check.value, "interval", var.target_groups_defaults["health_check_interval"])
      path                = lookup(health_check.value, "path", var.target_groups_defaults["health_check_path"])
      port                = lookup(health_check.value, "port", var.target_groups_defaults["health_check_port"])
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", var.target_groups_defaults["health_check_healthy_threshold"])
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", var.target_groups_defaults["health_check_unhealthy_threshold"])
      timeout             = lookup(health_check.value, "timeout", var.target_groups_defaults["health_check_timeout"])
      protocol            = lookup(health_check.value, "protocol", var.target_groups_defaults["health_check_protocol"])
      matcher             = lookup(health_check.value, "matcher", var.target_groups_defaults["health_check_matcher"])
    }
  }

  dynamic "stickiness" {
    for_each = length(keys(var.stickiness)) == 0 ? [] : [var.stickiness]

    content {
      enabled         = lookup(stickiness.value, "enabled", false)
      cookie_duration = lookup(stickiness.value, "cookie_duration", var.target_groups_defaults["cookie_duration"])
      type            = lookup(stickiness.value, "type", "lb_cookie")
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.name
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "attach_tg" {
  count            = var.target_count
  target_group_arn = aws_lb_target_group.my_tg.arn
  target_id        = var.targets
  port             = var.target_attachemnt_port
}

