FROM redhat/ubi8 
#RUN adduser amisha
#RUN usermod -aG sudo amisha
#RUN su - amisha
#USER amisha
WORKDIR /app
RUN chmod -R 777 /app
COPY package*.json ./
RUN yum install -y nodejs
RUN npm install -g n
RUN npm install -g --save dompurify@2.0.8 redoc-cli
RUN n 19.3.0
RUN npm cache clean --force 
RUN npm install
COPY . .
EXPOSE 3000
USER 1001
CMD ["npm","start"]
