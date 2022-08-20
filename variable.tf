variable "vpc_id" {
  type = string
}

variable "name" {
  type = list(string)
}

variable "port" {
  type = number
}

variable "protocol_version" {
  type = string
}

variable "protocol" {
  type = string
}

variable "target_type" {
  type = string
}

variable "health_check_protocol" {
  type = string
}

variable "health_check_path" {
  type = string
}

variable "health_check_port" {
  type = number
}

variable "healthy_threshold" {
   type = number
}

variable "unhealthy_threshold" {
   type = number
}

variable "timeout" {
   type = number
}
variable "interval" {
   type = number
}

variable "matcher" {
  type = string
}