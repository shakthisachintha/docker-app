#Base Image

FROM node:10.15.1-alpine

#create a new directory
RUN mkdir -p /docker-app

#workdirectory
WORKDIR /docker-app

#copy manifest files
COPY package.json package-lock.json ./

#Install Packages
RUN npm install

#copy the rest of the code
COPY . ./

#Expose
EXPOSE 4200

ENTRYPOINT ["./node_modules/.bin/ng"]
CMD ["serve", "--host","0.0.0.0"]