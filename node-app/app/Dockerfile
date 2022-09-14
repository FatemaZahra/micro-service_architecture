# base image
FROM node
# label
LABEL MAINTAINER=FATEMA
# inside the container what would Be the default working directory
#pwd homw/vagrant/ubuntu
#WRDIR usr/src/app
WORKDIR /usr/src/app
# copy dependencies -app folder
COPY package*.json ./
#copy all files with .json extention to default location
# run some commands such as npm install
RUN apt update
RUN npm install -g npm@latest
RUN npm install express
#COPY EVERYTHING FROM CURRENT LOCATION AND PASTE IN THE DEFAULT LOCATION
COPY . .
# expose the port 3000
EXPOSE 3000
# cmd ["node","app.js"]
CMD ["node","app.js"]
# BUILD THIS IMAGE - PACKAGE IT UP