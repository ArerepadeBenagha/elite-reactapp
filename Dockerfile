#/* docker build fcreactapp *\#
FROM node:alpine

# set working directory
WORKDIR /app

# install app dependencies
COPY package.json .
COPY package-lock.json .
COPY . .

RUN npm install -g npm@8.3.1
EXPOSE 3000

# start app
CMD ["npm","start"]