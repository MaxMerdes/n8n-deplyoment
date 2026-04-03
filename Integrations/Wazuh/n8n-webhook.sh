#!/bin/bash

# JSON vom Event lesen
read INPUT_JSON

# Beispiel: Felder extrahieren (jq muss installiert sein)
SRC_IP=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.data.srcip')
RULE_ID=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.rule.id')
LEVEL=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.rule.level')
FULL_LOG=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.full_log')

# Curl Request senden
curl -X POST https://dein-endpoint/api \
  -H "Content-Type: application/json" \
  -d "{
    \"src_ip\": \"$SRC_IP\",
    \"rule_id\": \"$RULE_ID\",
    \"level\": \"$LEVEL\",
    \"log\": \"$FULL_LOG\"
  }"