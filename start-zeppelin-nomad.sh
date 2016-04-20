#!/bin/sh
echo $NOMAD_ADDR_ui
exec /usr/local/zeppelin/bin/zeppelin-nomad.sh
