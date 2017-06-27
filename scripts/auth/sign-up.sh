#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/sign-up"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"hey"'",
      "password": "'"hey"'",
      "password_confirmation": "'"hey"'",
      "github_username": "username"
    }
  }'

echo
