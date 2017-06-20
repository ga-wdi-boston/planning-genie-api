#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/profiles"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "profile": {
      "user_id": "Practice",
      "given_name": "Chris",
      "family_name": "Payne",
      "photo_url": "http://study-practice"
    }
  }'

echo
