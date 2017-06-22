#!/bin/bash
TOKEN=
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/deliveries"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

# all deliveries
curl --include --request GET http://localhost:4741/deliveries

# a specific user's deliveries
curl --include --request GET http://localhost:4741/deliveries?user_id=1&all=true
curl --include --request GET http://localhost:4741/deliveries?all=true&user_id=1
curl --include --request GET http://localhost:4741/deliveries?all=true&?user_id=1
