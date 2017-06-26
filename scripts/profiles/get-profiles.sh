#!/bin/bash
TOKEN=
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/profiles"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo


curl --include --request GET http://localhost:4741/profiles
