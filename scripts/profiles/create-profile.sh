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
      "given_name": "Mister",
      "family_name": "Rogers",
      "photo_url": "http://mr-rogers"
    }
  }'

echo
