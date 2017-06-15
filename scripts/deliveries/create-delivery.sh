#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/deliveries"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "delivery": {
      "material_id": 2,
      "due_date": "2017-04-02",
      "prepper_id": "1",
      "reviewer_id": "1",
      "user_id": "1",
      "status": "Ready",
      "cohort": "wdi-bos-LM01"
    }
  }'


echo
