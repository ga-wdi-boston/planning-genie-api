#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/deliveries"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

curl --include --request DELETE http://localhost:4741/deliveries/$ID

curl --include --request DELETE http://localhost:4741/deliveries/3 \
  --header "Authorization: Token token=$TOKEN"
