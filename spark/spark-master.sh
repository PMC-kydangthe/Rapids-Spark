#!/bin/bash

echo "History server is sarting ...."

start-history-server.sh

echo "$(hostname -i) spark-master" >> /etc/hosts

/opt/spark/bin/spark-class org.apache.spark.deploy.master.Master --port 7077 --webui-port 8080
