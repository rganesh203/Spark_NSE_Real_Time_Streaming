import findspark
findspark.init('/etc/spark/spark-2.4.3-bin-hadoop2.7')
import os
os.environ['PYSPARK_SUBMIT_ARGS']='--packages \
org.apache.spark:spark-streaming-kafka-0-8_2.11:2.4.4 pyspark-shell'
import sys
import time
from pyspark.sql import SQLContext
from pyspark import SparkContext, SparkConf
from pyspark.streaming import StreamingContext
from pyspark.streaming.kafka import KafkaUtils
from pyspark.streaming import kafka
import json
from pyspark.sql.types import StructType, StructField, StringType, DoubleType
def formateddata(line):
    #output of this function [tcs,20200919:2121,232]
    symbol = line['symbol']
    systime = line['systime']
    lastPrice = line['lastPrice']
    stockdate = line['date']
    stocktime = line['time']
    return [stockdate,stocktime,symbol,systime,lastPrice]

def saveAsParquet(rdd):
    print('in save a parquet')
    if not rdd.isEmpty():
        rdd1 = rdd.map(lambda x: json.loads(x[1]))
        rdd2 = rdd1.map(lambda x : formateddata(x))
        df = sqlContext.createDataFrame(rdd2)
        print('  writing file')
        df.coalesce(1).write.csv('/streaming/output3/', mode='append')
    print('return save as parquet')
    return rdd


n_secs = 50

a = ''' this is to test the maximum  character you can write in a  
    single line in python without breaking pep80 rules .  
    what is th emaximum charaters in a single line '''
a = "1234.22"

topic = "financialdata"
schema = StructType([StructField("symbol", StringType(), True),StructField("systime", StringType(), True),StructField("lastPrice", DoubleType(), True)])
conf = SparkConf().setAppName("sparkkafka").setMaster("yarn")
sc = SparkContext(conf=conf)
sqlContext = SQLContext(sc)
sc.setLogLevel("WARN")
ssc = StreamingContext(sc, n_secs)
kafkaStream = KafkaUtils.createDirectStream(ssc, [topic],
{'bootstrap.servers':'192.168.0.114:9092',
 'fetch.message.max.bytes':'15728640', 'auto.offset.reset':'largest'})
kafkaStream.foreachRDD(lambda x: saveAsParquet(x))
kafkaStream.pprint()
#kafkaStream.saveAsTextFiles("file:///root/dstream")
ssc.start()
#time.sleep(300)
ssc.awaitTermination()