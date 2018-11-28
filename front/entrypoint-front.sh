#! /bin/bash

# BACKEND_URL=${BACKEND_PROTOCOL}://${BACKEND_HOST}
# sed -i -e "s|http://changeme|$BACKEND_URL|g" /code/ownphotos-frontend/src/api_client/apiClient.js
# cd /code/ownphotos-frontend
# npm run build
serve -s build
