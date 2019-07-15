

variable "open_ports" {
  description = "Default open port range"
  default = 8080
}

variable "publicly_accessible" {
    description = "Determines if database can be publicly available (NOT recommended)"
    default = true
}


variable "vpc_id" {
    description = "VPC to connect to, used for a security group"
    type = "string"
}


variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {
      project = "aws-certs",
      owner   = "icullinane",
      environment = "dev"
  }
}
