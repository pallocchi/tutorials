#!/bin/sh

set -eu pipefail

echo "Attempting to connect to cicd-postman-tests-api"
until $(nc -zv cicd-postman-tests-api 5050); do
    printf '.'
    sleep 5
done
echo "Connected to cicd-postman-tests-api!"

newman run /src/postman-collection.json

exit 0