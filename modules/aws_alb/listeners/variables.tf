variable "create_lb" {
  description = "Controls if the Load Balancer should be created"
  type        = bool
  default     = true
}

variable "https_listeners" {
  description = "A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate_arn. Optional key/values: ssl_policy (defaults to ELBSecurityPolicy-2016-08), target_group_index (defaults to 0)"
  type        = map(string)
  default     = {}
}

variable "static_listeners" {
  description = "A list of maps describing the listeners for this ALB."
  type        = map(string)
  default     = {}
}

variable "https_listeners_count" {
  description = "A manually provided count/length of the https_listeners list of maps since the list cannot be computed."
  type        = number
  default     = 0
}

variable "http_tcp_listeners" {
  description = "A list of maps describing the HTTP listeners for this ALB. Required key/values: port, protocol. Optional key/values: target_group_index (defaults to 0)"
  type        = map(string)
  default     = {}
}

variable "http_tcp_listeners_count" {
  description = "A manually provided count/length of the http_tcp_listeners list of maps since the list cannot be computed."
  type        = number
  default     = 0
}

variable "extra_ssl_certs" {
  description = "A list of maps describing any extra SSL certificates to apply to the HTTPS listeners. Required key/values: certificate_arn, https_listener_index (the index of the listener within https_listeners which the cert applies toward)."
  type        = list(object({ certificate_arn = string, https_listener_index = number }))
  default     = []
}

variable "listener_ssl_policy_default" {
  description = "The security policy if using HTTPS externally on the load balancer. [See](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html)."
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "load_balancer_arn" {
  description = "ARN of the load balancer"
  type        = any
}

variable "listener_type" {
  type    = string
  default = "HTTP"
}

