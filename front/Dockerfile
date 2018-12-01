FROM node:8-alpine

# WORKDIR /
# RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
# RUN bash nodesource_setup.sh
# RUN apt-get install nodejs

# RUN rm -rf /var/lib/apt/lists/*
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && apk add git

WORKDIR /code
RUN git clone https://github.com/hooram/ownphotos-frontend.git
WORKDIR /code/ownphotos-frontend
RUN mv /code/ownphotos-frontend/src/api_client/apiClientDeploy.js /code/ownphotos-frontend/src/api_client/apiClient.js

RUN npm config set registry https://registry.npm.taobao.org
RUN npm install
RUN npm install -g serve

ENV BACKEND_URL=192.168.99.100:8000
RUN sed -i -e "s|changeme|$BACKEND_URL|g" /code/ownphotos-frontend/src/api_client/apiClient.js

RUN npm run build


# RUN ls /code
# ENTRYPOINT ./code/ownphotos-frontend/entrypoint-front.sh
CMD [ "serve","-s","build" ]