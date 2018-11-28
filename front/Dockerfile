FROM node:8-alpine

# WORKDIR /
# RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
# RUN bash nodesource_setup.sh
# RUN apt-get install nodejs

# RUN rm -rf /var/lib/apt/lists/*
RUN apk add git

WORKDIR /code
RUN git clone https://github.com/hooram/ownphotos-frontend.git
WORKDIR /code/ownphotos-frontend
RUN mv /code/ownphotos-frontend/src/api_client/apiClientDeploy.js /code/ownphotos-frontend/src/api_client/apiClient.js

RUN npm --registry https://registry.npm.taobao.org info underscore
RUN npm install

ENV BACKEND_URL=http://192.168.99.100:8000
RUN sed -i -e "s|http://changeme|$BACKEND_URL|g" /code/ownphotos-frontend/src/api_client/apiClient.js

RUN npm run build
COPY entrypoint-front.sh /code
ENTRYPOINT ./entrypoint-front.sh