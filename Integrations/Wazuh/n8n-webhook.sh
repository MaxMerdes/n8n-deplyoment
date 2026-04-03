#!/bin/bash

# JSON vom Event lesen
read INPUT_JSON

# Felder extrahieren
RULE_ID=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.rule.id')
RULE_LEVEL=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.rule.level')
RULE_DESC=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.rule.description')
AGENT_ID=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.agent.id')
AGENT_NAME=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.agent.name')
SRC_IP=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.data.srcip // empty')
FULL_LOG=$(echo "$INPUT_JSON" | jq -r '.parameters.alert.full_log')

# Curl Request an n8n oder direkt an PostgreSQL Webhook
curl -k -X POST https://dein-endpoint/api \
  -H "Content-Type: application/json" \
  -d "{
        \"rule_id\": \"$RULE_ID\",
        \"rule_level\": $RULE_LEVEL,
        \"rule_description\": \"$RULE_DESC\",
        \"agent_id\": \"$AGENT_ID\",
        \"agent_name\": \"$AGENT_NAME\",
        \"src_ip\": \"$SRC_IP\",
        \"full_log\": \"$FULL_LOG\"
      }"