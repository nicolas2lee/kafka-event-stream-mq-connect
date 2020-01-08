terraform {
  backend "s3" {
    bucket = "kafka-event-stream-mq-connect-state"
    region = var.terraform_backend_region
  }
}

data "ibm_resource_group" "group" {
  name = var.resource_group
}

resource "ibm_resource_instance" "event_stream_messagehub_resource_instance" {
  name              = "kafka-mq-connect-demo-kafka"
  location          = "us-south"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  service           = "messagehub"
  plan              = "lite"
}

resource "ibm_resource_instance" "mq_resource_instance" {
  name              = var.mq["name"]
  location          = var.mq["location"]
  resource_group_id = "${data.ibm_resource_group.group.id}"
  service           = "mqcloud"
  plan              = var.mq["lite"]
}