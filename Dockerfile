FROM node:14-slim

RUN apt-get update && apt-get -y install procps

WORKDIR /app

# Add our package.json and install *before* adding our application files
COPY package.json /app
# COPY package-lock.json /app

RUN npm install
RUN npm install -g mocha nodemon

# Now add application files
COPY . /app

RUN mkdir -p public/dist
RUN npm run build-client

RUN mkdir /app/secrets /app/logs /app/db

RUN mv /app/accounts.js /app/secrets/
RUN mv /app/telegram.js /app/secrets/

# Expose the port
EXPOSE 3000

# TODO:  implment ability to pass DO_APPROVE
# COPY docker-entrypoint.sh /usr/local/bin/
# ENTRYPOINT ["bash", "docker-entrypoint.sh"]

# TODO: change start type to use .env(?)
CMD ["sh", "-c", "npm run start:${WHICHNET} ${KEYPW}"]