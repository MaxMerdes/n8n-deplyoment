#!/bin/bash

URL="https://n8n.domain/webhook/id"
‚
PAYLOAD=$(jq -n \
  --arg host "$NOTIFY_HOSTNAME" \
  --arg service "$NOTIFY_SERVICEDESC" \
  --arg state "$NOTIFY_SERVICESTATE" \
  --arg output "$NOTIFY_SERVICEOUTPUT" \
  '{
    host: $host,
    service: $service,
    state: $state,
    output: $output
  }'
)

curl -k -X POST -H "Content-Type: application/json" \
     -d "$PAYLOAD" "$URL"