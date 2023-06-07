import findspark
findspark.init('/etc/spark/spark-2.4.3-bin-hadoop2.7')
import os
os.environ['PYSPARK_SUBMIT_ARGS']='pyspark-shell'
import sys
import time
from pyspark import SparkContext, SparkConf
from pyspark.streaming import StreamingContext
n_secs = 1

conf = SparkConf().setAppName("sparkkafka").setMaster("yarn")
sc = SparkContext(conf=conf)
sc.setLogLevel("WARN")
ssc = StreamingContext(sc, n_secs)
wordsDstream = ssc.socketTextStream("192.168.0.140",9999)
wordsDstream.pprint()
ssc.start()

ssc.awaitTermination()