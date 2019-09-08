FROM keymetrics/pm2:latest-alpine

# Bundle APP files
COPY src src/
COPY config config/
COPY images images/
COPY pem_files pem_files/
COPY public public/
COPY test test/
COPY .env .
COPY .nvmrc .
COPY package.json .
COPY pm2.json .

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
RUN apk add --no-cache --virtual .gyp \
        python \
        make \
        g++ \
    #&& ls -lA \
    #&& pwd \
    #&& npm bin \
    && npm install --arch=x64 --platform=linuxmusl --production \
    && rm -rf ./src/libs/sharp/vendor \
    && npm install --arch=x64 --platform=linuxmusl sharp --production \
    #&& npm install \
    #    [ your npm dependencies here ] \
    && apk del .gyp
# RUN npm install --production

# Show current folder structure in logs
RUN ls -al -R

CMD [ "pm2-runtime", "start", "pm2.json" ]
