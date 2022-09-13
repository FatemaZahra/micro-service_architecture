# Micro-service Architecture

## What is Containerisation?

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

## What is Docker?

Docker is the containerization platform that is used to package your application and all its dependencies together in the form of containers to make sure that your application works seamlessly in any environment which can be developed or tested or in production. Docker is a tool designed to make it easier to create, deploy, and run applications by using containers.

## Who is using Docker?

Docker is designed to benefit both developers and system administrators making it a part of many DevOps toolchains. Developers can write code without worrying about the testing and production environment. Sysadmins need not worry about infrastructure as Docker can easily scale up and scale down the number of systems. Docker comes into play at the deployment stage of the software development cycle.

![img](images/Screenshot%202022-09-12%20at%2011.18.21.png)

## Benefits of Conterisation

- Portability

An application container creates an executable software package abstracted away from the host OS. Hence, it is not dependent upon or tied to the host OS, making it portable and allowing it to run consistently and uniformly across any platform or cloud.

- Speed

Developers refer to containers as “lightweight” because they share the host machine’s OS kernel and aren’t subject to extra overhead. Using a Docker container, you can create a master version of an application (image) and deploy it quickly on demand.

- Scalability

Application container technology offers high scalability. An application container can handle increasing workloads by reconfiguring the existing architecture to enable resources using a service-oriented app design.

- Agility

Developers can continue using DevOps tools and processes for rapid app development and enhancement.

- Efficiency

They require minimal startup times, allowing developers to run more containers on the same compute capacity as one virtual machine.

# Virtualisation vs Containerisation

Virtualization and containerization are the two most frequently used mechanisms to host applications in a computer system. Virtualization uses the notion of a virtual machine as the fundamental unit. Containerization, on the other hand, uses the concept of a container.

![img](images/Screenshot%202022-09-12%20at%2011.29.36.png)

## Commands

`docker run hello-world`

`docker images` # lists the images

`docker ps` # lists containers

`docker ps -a`

`docker run -p 80:80 nginx`

`docker run -d -p 80:80 nginx` # runs the nginx image on port 80 (and detached)

`docker stop ID_of_container`

`docker start ID_of_container`

`docker rm ID_of_container -f` Delete container

`docker rmi Image_ID -f ` Delete image

`docker exec -it b6d79d726693 sh`

`docker exec -it b6d79d726693 bash`

`cd /usr/share/nginx/html`

`sudo nano index.html`

update and install sudo nano if needed `apt-get update` `apt install sudo` `apt install nano`

`docker commit container_ID username/image_name:tag`

`docker push username/image_name:tag`

`docker login`

and push again

## Moving file from localhost to container

- Create an index.html file on localhost
- docker run -d -p 80:80 nginx
- Delete exisiting index.html in container `docker exec container_ID rm -rf /usr/share/nginx/html/index.html`
- Copy file from localhost to container: `docker cp index.html container_ID:/usr/share/nginx/html`

## Creating a web server using Dockerfile

- Create an index.html
- Create a Dockerfile

```

# Select base image

FROM nginx

# label it

LABEL MAINTAINER=fatema@dev

# copy data from loaclhost to the container

COPY index.html /usr/share/nginx/html/

# allow required port

EXPOSE 80

# execute required command

CMD ["nginx","-g","daemon off;"]

```

`docker build -t fatemazahra/eng122_nginx_web_hosting .`

`docker run -d -p 100:80 fatemazahra/eng122_nginx_web_hosting`

`docker push fatemazahra/eng122_nginx_web_hosting`

## Building a Docker image for our node app

- create a micro-service for node-app
- create Dockerfile inside the app folder
- create a script to package our node app in an image
- create a container of our image
- should load it on port 3000 or port 80
- push it to docker hub

## Steps

- Copy the node app
- Create a Dockerfile at the same location as the app

```t
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
RUN npm install -g npm@7.20.6

#COPY EVERYTHING FROM CURRENT LOCATION AND PASTE IN THE DEFAULT LOCATION
COPY . .

# expose the port 3000
EXPOSE 3000

# cmd ["node","app.js"]
CMD ["node","app.js"]

# BUILD THIS IMAGE - PACKAGE IT UP
```

`docker build -t fatemazahra/eng122_node_app .`

`docker run -d -p 3000:3000 fatemazahra/eng122_node_app`

`docker push fatemazahra/eng122_node_app`
