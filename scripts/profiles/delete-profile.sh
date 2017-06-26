#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/materials"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo

curl --include --request DELETE http://localhost:4741/materials/$ID

curl --include --request DELETE http://localhost:4741/materials/3 \
  --header "Authorization: Token token=$TOKEN"
