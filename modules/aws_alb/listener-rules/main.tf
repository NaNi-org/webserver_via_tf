resource "aws_lb_listener_rule" "this" {

  count        = length(var.listener_rules)
  listener_arn = var.listener_arn
  priority     = var.listener_rules[count.index]["listener_rule_priority"]

  action {
    type             = "forward"
    target_group_arn = var.listener_rules[count.index]["target_group_arn"]
  }

  condition {
    host_header {
      values = lookup(
        var.listener_rules[count.index],
        "values",
        "",
      )
    }
  }

}

resource "aws_lb_listener_rule" "path_pattern" {

  count        = length(var.listener_rules_path_pattern)
  listener_arn = var.listener_arn
  priority     = var.listener_rules_path_pattern[count.index]["listener_rule_priority"]

  action {
    type             = "forward"
    target_group_arn = var.listener_rules_path_pattern[count.index]["target_group_arn"]
  }

  condition {
    path_pattern {
      values = lookup(
        var.listener_rules_path_pattern[count.index],
        "values",
        "",
      )
    }
  }

}

resource "aws_lb_listener_rule" "source_ip" {

  count        = length(var.listener_rules_source_ip)
  listener_arn = var.listener_arn
  priority     = var.listener_rules_source_ip[count.index]["listener_rule_priority"]

  action {
    type             = "forward"
    target_group_arn = var.listener_rules_source_ip[count.index]["target_group_arn"]
  }

  condition {
    source_ip {
      values = lookup(
        var.listener_rules_source_ip[count.index],
        "values",
        "",
      )
    }
  }

}

