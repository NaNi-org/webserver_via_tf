output "http_tcp_listener_arns" {
  description = "The ARN of the TCP and HTTP load balancer listeners created."
  value = slice(
    concat(
      aws_lb_listener.http.*.arn,
    ),
    0,
    var.http_tcp_listeners_count,
  )
}

output "http_tcp_listener_ids" {
  description = "The IDs of the TCP and HTTP load balancer listeners created."
  value = slice(
    concat(
      aws_lb_listener.http.*.id,
    ),
    0,
    var.http_tcp_listeners_count,
  )
}

output "https_listener_arns" {
  description = "The ARNs of the HTTPS load balancer listeners created."
  value       = aws_lb_listener.https.*.arn
}

output "https_listener_ids" {
  description = "The IDs of the load balancer listeners created."
  value = slice(
    concat(
      aws_lb_listener.https.*.id,
    ),
    0,
    var.https_listeners_count,
  )
}
