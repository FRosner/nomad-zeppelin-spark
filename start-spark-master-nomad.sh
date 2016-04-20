#!/bin/sh
MASTER_PORT=$(echo $NOMAD_ADDR_master | cut -f2 -d:)
MASTER_HOST=$(echo $NOMAD_ADDR_master | cut -f1 -d:)
WEBUI_PORT=$(echo $NOMAD_ADDR_webui | cut -f2 -d:)

echo "Master host: $MASTER_HOST$"
echo "Master port: $MASTER_PORT"
echo "Webui port: $WEBUI_PORT"
exec /usr/local/spark/bin/spark-class org.apache.spark.deploy.master.Master \
--host $MASTER_HOST \
--port $MASTER_PORT \
--webui-port $WEBUI_PORT
