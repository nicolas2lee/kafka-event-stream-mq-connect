

[Connecting IBM MQ to IBM event stream](https://cloud.ibm.com/docs/services/EventStreams?topic=eventstreams-mq_connector)


CLASSPATH=/home/kafka-event-stream-mq-connect/mq/kafka-connect-mq-source-1.2.0-SNAPSHOT-jar-with-dependencies.jar \
/opt/kafka_2.11-0.10.1.0/bin/connect-standalone.sh \
/home/kafka-event-stream-mq-connect/eventstream/connector-standalone.properties \
/home/kafka-event-stream-mq-connect/mq/mq-source.properties