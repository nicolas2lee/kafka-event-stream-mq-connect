

[Connecting IBM MQ to IBM event stream](https://cloud.ibm.com/docs/services/EventStreams?topic=eventstreams-mq_connector)


CLASSPATH=/home/kafka-event-stream-mq-connect/mq/kafka-connect-mq-sink-1.2.0-SNAPSHOT-jar-with-dependencies.jar \
/opt/kafka_2.11-0.10.1.0/bin/connect-standalone.sh \
/home/kafka-event-stream-mq-connect/eventstream/connector-standalone.properties \
/home/kafka-event-stream-mq-connect/mq/mq-sink.properties



CLASSPATH=/Users/xinrui/tao/apps/github/kafka-event-stream-mq-connect/mq/kafka-connect-mq-sink-1.2.0-SNAPSHOT-jar-with-dependencies.jar \
/Users/xinrui/tao/software/confluent-5.3.1/bin/connect-standalone \
/Users/xinrui/tao/apps/github/kafka-event-stream-mq-connect/eventstream/connector-standalone.properties \
/Users/xinrui/tao/apps/github/kafka-event-stream-mq-connect/mq/mq-sink.properties
