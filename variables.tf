variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}


/* variable "public_subnet" {
  type = list(string)
  default = ["subnet-01155e65fceede93c", "subnet-0bdd413798aab4177"]
}

variable "private_subnet" {
  type = list(string)
  default = ["subnet-0a8a0fc4cf99264c3", "subnet-093db2204c5574fd7"]
} */

variable "instance_id" {
  default = "i-062b5322226eb1b86"
}