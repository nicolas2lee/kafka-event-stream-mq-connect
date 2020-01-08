variable "terraform_backend_region" {
  default = "eu-geo"
}

variable "resource_group" {
  default = "DXLab"
}

variable "mq" {
  type = "map"
  default = {
    "name"              = "kafka-mq-connect-demo-mq"
    "location"          = "us-south"
    "plan"              = "lite"
  }
}
