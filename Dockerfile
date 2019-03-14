FROM keymetrics/pm2:8-jessie

#install deps, build, remove initial sources, dev deps
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends
RUN npm i -g npm && \
    npm install -g sequelize-cli && \
    npm install -g bzip2

# API_HTTP_PORT
EXPOSE 3030

# API_ES_PORT
EXPOSE 9243

# API_DOCS_PORT
EXPOSE 4400
EXPOSE 7000
CMD [ "pm2-runtime", "./bin/www" ]
