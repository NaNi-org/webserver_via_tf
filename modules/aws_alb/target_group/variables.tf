variable "name" {
  description = "Name of the target group"
  type        = string
}

variable "vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
  type        = string
}

variable "target_groups" {
  description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend_protocol, backend_port. Optional key/values are in the target_groups_defaults variable."
  type        = any
  default     = []
}

variable "backend_port" {
  type    = number
  default = 80
}

variable "backend_protocol" {
  type    = string
  default = "HTTP"
}

variable "target_group_attachment" {
  description = "attach ec2 instance to target group"
  type        = list(map(string))
  default     = []
}

variable "target_group_attachment_count" {
  type    = number
  default = 0
}

variable "target_groups_count" {
  description = "A manually provided count/length of the target_groups list of maps since the list cannot be computed."
  type        = number
  default     = 0
}

variable "health_check" {
  description = "Health check parameters of the target group"
  type        = map(string)
  default     = {}
}

variable "stickiness" {
  description = "stickiness parameters of the target group"
  type        = map(string)
  default     = {}
}

variable "targets" {
  description = "Instance Ids to be attached to the target group"
  type        = string
  default     = null

}

variable "target_attachemnt_port" {
  description = "Port on which the targets are attached"
  type        = number
}

variable "target_groups_defaults" {
  description = "Default values for target groups as defined by the list of maps."
  type = object(
    {
      health_check_protocol            = string,
      cookie_duration                  = string,
      deregistration_delay             = string,
      health_check_interval            = string,
      health_check_healthy_threshold   = string,
      health_check_path                = string,
      health_check_port                = string,
      health_check_timeout             = string,
      health_check_unhealthy_threshold = string,
      health_check_matcher             = string,
      target_type                      = string,
      slow_start                       = string,
    }
  )
  default = {
    health_check_protocol            = "HTTP"
    cookie_duration                  = 86400
    deregistration_delay             = 300
    health_check_interval            = 5
    health_check_healthy_threshold   = 2
    health_check_path                = "/"
    health_check_port                = "traffic-port"
    health_check_timeout             = 3
    health_check_unhealthy_threshold = 2
    health_check_matcher             = "200-499"
    target_type                      = "instance"
    slow_start                       = 0
  }
}

variable "target_type" {
  description = "Type of targets to be attached to target groups"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "create_tg" {
  description = "Enable target group creation"
  type        = bool
  default     = true
}

variable "target_count" {
  type    = number
  default = 1
}

variable "target-count" {
  description = "Gives the count to target group attachement"
  type        = number
  default     = 1
}

