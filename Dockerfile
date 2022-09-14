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