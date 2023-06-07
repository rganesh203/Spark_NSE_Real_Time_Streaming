#from googlefinance import getQuotes
import json
#print(json.dumps(getQuotes('AAPL'), indent=2))
#import yfinance as yf
#msft = yf.Ticker("GOOG")
#print(msft)
from nsetools import Nse
from datetime import datetime
import time
from kafka import KafkaProducer
try:
    producer = KafkaProducer(bootstrap_servers="192.168.0.142:9092")
    nse = Nse()
    symbolList = ['sbin', 'tcs', 'infy']
    while True:
        systime = datetime.now()
        #21-08-2021 10:08:20
        stockdate = str(systime).split(" ")[0]
        stocktime = str(systime).split(" ")[1].split(".")[0]
        for symbol in symbolList:
            #print(symbol)
            q = nse.get_quote(symbol)
            print(q)
            finaldict = dict()
            finaldict["symbol"] = str(symbol)
            finaldict["systime"] = str(systime)
            finaldict['date'] = str(stockdate)
            finaldict['time'] = str(stocktime)
            finaldict['lastPrice'] = q['lastPrice']
            #print(finaldict)
            msg = json.dumps(finaldict)
            producer.send("financialdata", msg.encode('utf-8'))
        time.sleep(300)

        """
        q = nse.get_quote('infy')
        # print(q['lastPrice'])
        systime = datetime.now()
        finaldict = dict()
        finaldict["systime"] = str(systime)
        finaldict['lastPrice'] = q['lastPrice']
        print(finaldict)
        msg = json.dumps(finaldict)
        producer.send("financialdata", msg.encode('utf-8'))
        time.sleep(60)
        """
except KeyboardInterrupt:
    print('interrupted!')



