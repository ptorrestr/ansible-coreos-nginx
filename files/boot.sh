#!/bin/bash

# Capture signal
trap "service gunicorn stop; exit" SIGTERM SIGINT SIGQUIT

# Fail hard and fast
set -eo pipefail

echo "[myapp] container booted. Host: $HOST_IP, Port: $PORT"
echo "[myapp] Config file (static):"
cat /etc/gunicorn.d/myapp.conf | xargs -0 -L1 echo

# Start the Myapp service using static config
echo "[myapp] starting gunicorn..."
service gunicorn start

# Follow the logs to allow the script to continue running
read
