#!/bin/bash

URL="https://..."
LOGFILE="/tmp/webhook_debug.log"

echo "---- $(date) ----" >> $LOGFILE
echo "Host: $NOTIFY_HOSTNAME, Service: $NOTIFY_SERVICEDESC, State: $NOTIFY_SERVICESTATE" >> $LOGFILE

# Payload sicher zusammenbauen
PAYLOAD=$(printf '{"host":"%s","service":"%s","state":"%s","output":"%s"}' \
  "$NOTIFY_HOSTNAME" "$NOTIFY_SERVICEDESC" "$NOTIFY_SERVICESTATE" "$NOTIFY_SERVICEOUTPUT")

echo "Payload: $PAYLOAD" >> $LOGFILE

# Vollständiger Pfad zu curl verwenden
/usr/bin/curl -k -X POST -H "Content-Type: application/json" -d "$PAYLOAD" "$URL" >> $LOGFILE 2>&1

echo "Exit code: $?" >> $LOGFILE