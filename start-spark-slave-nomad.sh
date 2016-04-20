#!/bin/sh
echo "Master: $MASTER$"
exec /usr/local/spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
spark://$MASTER
