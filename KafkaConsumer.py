import kafka
import sys
import json

bootstrap_servers = ['192.168.0.142:9092']
topicName = 'pythonkafka1'
consumer = kafka.KafkaConsumer(topicName, bootstrap_servers =
bootstrap_servers)

count = 0
print("out try")
try:
    #consumer.assign("pythonkafka1")
    #consumer.seek_to_beginning()
    for message in consumer:
        print("in try")
        #print(type(message.value))
        #print (message.topic, message.partition,message.offset, message.key, message.value)
        print("msg is :"+str(message.value))
        print("offset is :"+str(message.offset))
        print("partition is :"+str(message.partition))
        #info = json.loads(message.value)


except KeyboardInterrupt:
    sys.exit()