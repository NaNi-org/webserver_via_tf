resource "aws_lb" "application" {
  count = var.create_alb && var.logging_enabled ? 1 : 0

  load_balancer_type               = var.load_balancer_type
  name                             = var.load_balancer_name
  internal                         = var.internal
  security_groups                  = var.security_groups
  subnets                          = var.subnets
  idle_timeout                     = var.idle_timeout
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2
  ip_address_type                  = var.ip_address_type

  tags = merge(
    var.tags,
    {
      "Name" = var.load_balancer_name
    },
  )

  dynamic "access_logs" {
    for_each = length(keys(var.access_logs)) == 0 ? [] : [var.access_logs]

    content {
      enabled = lookup(access_logs.value, "enabled", lookup(access_logs.value, "bucket", null) != null)
      bucket  = lookup(access_logs.value, "bucket", null)
      prefix  = lookup(access_logs.value, "prefix", null)
    }
  }

  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping

    content {
      subnet_id     = subnet_mapping.value.subnet_id
      allocation_id = lookup(subnet_mapping.value, "allocation_id", null)
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts

    content {
      create = lookup(timeouts.value, "load_balancer_create_timeout", 10)
      delete = lookup(timeouts.value, "load_balancer_delete_timeout", 10)
      update = lookup(timeouts.value, "load_balancer_update_timeout", 10)
    }
  }
}
