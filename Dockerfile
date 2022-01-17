#/* docker build fcreactapp *\#
FROM node:alpine

# set working directory
WORKDIR /app

# install app dependencies
COPY package.json .
COPY . .

RUN npm install --silent
EXPOSE 3000

# start app
CMD ["npm", "start"]