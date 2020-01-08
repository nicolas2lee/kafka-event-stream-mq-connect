variable "api_key" {
  default = "<api-key>"

}

variable "terraform_backend" {
  type = "map"
  default = {
    bucket            = "kafka-event-stream-mq-connect-state"
    region            = "eu-geo"
    key               = "terraform.tfstate"
    access_key        = "<access-key>"
    secret_key        = "<secret-key>"
  }
}

variable "resource_group" {
  default = "DXLab"
}

variable "mq" {
  type = "map"
  default = {
    name              = "kafka-mq-connect-demo-mq"
    location          = "us-south"
    plan              = "lite"
  }
}

variable "eventstream" {
  type = "map"
  default = {
    name              = "kafka-mq-connect-demo-kafka"
    location          = "us-south"
    plan              = "lite"
  }
}
