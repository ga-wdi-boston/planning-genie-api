#!/bin/bash
ID=3
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/materials/$ID"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "material": {
      "material_type": "Practice",
      "name": "rails-api-practice"
    }
  }'

echo
