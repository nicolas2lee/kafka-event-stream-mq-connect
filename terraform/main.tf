
data "ibm_resource_group" "group" {
  name = "DXLab"
}

resource "ibm_resource_instance" "event_stream_messagehub_resource_instance" {
  name              = "kafka-mq-connect-demo-kafka"
  location          = "us-south"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  service           = "messagehub"
  plan              = "lite"
}

resource "ibm_resource_instance" "mq_resource_instance" {
  name              = "kafka-mq-connect-demo-mq"
  location          = "eu-de"
  resource_group_id = "${data.ibm_resource_group.group.id}"
  service           = "mqcloud"
  plan              = "lite"
}