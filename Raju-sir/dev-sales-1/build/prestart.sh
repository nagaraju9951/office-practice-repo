#!/bin/bash
echo "Start my initialization script..."
echo $HOSTNAME
# Now start niginx
/docker-entrypoint.sh    "nginx"  "-g" "daemon off;"