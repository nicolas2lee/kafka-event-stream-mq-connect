terraform {
  backend "s3" {
//    bucket = "${var.terraform_backend["bucket"]}"
//    region = "${var.terraform_backend["region"]}"
//    key    = "${var.terraform_backend["key"]}"
//    access_key = "${var.terraform_backend["access_key"]}"
//    secret_key = "${var.terraform_backend["secret_key"]}"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    bucket                      = "kafka-event-stream-mq-connect-state"
    key                         = "terraform.tfstate"
    region                      = "eu-geo"
    endpoint                    = "s3.eu.cloud-object-storage.appdomain.cloud"
    access_key                  = "<access-key>"
    secret_key                  = "<secret-key>"
  }
}

data "ibm_resource_group" "group" {
  name = var.resource_group
}

resource "ibm_resource_instance" "event_stream_messagehub_resource_instance" {
  name              = "${var.eventstream["name"]}"
  location          = "${var.eventstream["location"]}"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  service           = "messagehub"
  plan              = "${var.eventstream["plan"]}"
}

resource "ibm_resource_instance" "mq_resource_instance" {
  name              = "${var.mq["name"]}"
  location          = "${var.mq["location"]}"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  service           = "mqcloud"
  plan              = "${var.mq["plan"]}"
}