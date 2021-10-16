resource "aws_lb_listener" "https" {
  count = var.listener_type == "HTTPS" ? 1 : 0

  load_balancer_arn = var.load_balancer_arn

  port            = 443
  protocol        = "HTTPS"
 # certificate_arn = var.https_listeners["certificate_arn"]
  ssl_policy = lookup(
    var.https_listeners,
    "ssl_policy",
    var.listener_ssl_policy_default,
  )

  default_action {
    target_group_arn = var.https_listeners["target_group_arn"]
    type             = "forward"
  }
}

resource "aws_lb_listener" "http" {
  count = var.listener_type == "HTTP" ? 1 : 0

  load_balancer_arn = var.load_balancer_arn

  port     = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "main" {
  count = var.listener_type == "static" ? 1 : 0

  load_balancer_arn = var.load_balancer_arn

  port     = lookup(var.static_listeners, "port")
  protocol = lookup(var.static_listeners, "protocol")

  default_action {
    type             = "forward"
    target_group_arn = var.static_listeners["target_group_arn"]
  }
}

 /* resource "aws_lb_listener_certificate" "https_listener" {
   listener_arn    = aws_lb_listener.https[var.extra_ssl_certs["https_listener_index"]].arn
   certificate_arn = var.extra_ssl_certs["certificate_arn"]
 } */
