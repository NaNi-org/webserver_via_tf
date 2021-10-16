variable "listener_rules" {
  description = "Rules for LB listers"
  type        = any
  default     = []
}

variable "listener_rules_path_pattern" {
  description = "Rules for LB listers"
  type        = any
  default     = []
}

variable "listener_rules_source_ip" {
  description = "Rules for LB listers"
  type        = any
  default     = []
}

variable "listener_arn" {
  description = "LB listener group arn"
  type        = string
}

variable "field" {
  description = "Source Field for listener rule condition"
  type        = string
  default     = ""
}

# variable "priority" {
#   description = "listener rules  priority for the rule between 1 and 50000"
#   type        = number
#   default     = 5000
# }

# variable "listener_rule_priority" {}

# variable "target_group_arn" {}

# variable "values" {}


# variable "listener_rule_condition_field" {
#   default     = "host-header"
#   type        = "string"
#   description = "The name of the field. Must be one of path-pattern for path based routing or host-header for host based routing."
# }

# variable "listener_rule_priority" {
#   default     = 5000
#   type        = any
#   description = "The priority for the rule between 1 and 50000."
# }

# variable "listener_rule_condition_values" {
#   # default     = ["/*"]
#   type        = list
#   description = "The path patterns to match. A maximum of 1 can be defined."
# }