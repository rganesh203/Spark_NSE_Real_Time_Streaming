import json
from bson import json_util
from kafka import KafkaProducer
import time

producer = KafkaProducer(bootstrap_servers='192.168.0.114:9092')
print("sending message")
for i in range(10):
    data = { 'tag ': 'blah',
        'time' : time.time(),
        'index' : i,
        'score': 
            {'row1': 100,
             'row2': 200
        }
    }

    producer.send('pythonkafka1', json.dumps(data, default=json_util.default).encode('utf-8'))
print("message sent")