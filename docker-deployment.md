# 1.0 Install Docker(for ubuntu 20.04LTS)

```shell
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version

```

# 2.0 nginx

### 2.1 install Nginx

```shell
sudo docker pull nginx 
sudo docker images
```

​	run a docker container for Nginx

​	#-p 80:80  map 80 port to container inside 80 port

```shell
sudo docker run -di -p 80:80 --name=mynginx nginx
```

### 2.2 check Nginx

open the instance or Vmware IP address for 80 port

![](C:\Users\troybaba\Desktop\nginx.png)

### 2.3  copy our  Front-end dist file to instance and name it as html, then put it into nginx container to replace html file as index page

```shell
sudo mv dist html #change the dist folder name to html
sudo docker ps  #check containers
sudo docker cp html [container name/ID]:/usr/share/nginx/ #move it to nginx
```



### 2.4 build the changed container into our own image

````shell
sudo docker commit -a "[your name]"  [container name/ID] [image name]:1.0  #1.0 is the version
````

### 2.5 run the new image

```shell	
sudo docker run -di -p 80:80 --name=[container name] [image name]:[version/tag]
```

### 2.6 check container

```shell
sudo docker ps
```

### 2.7 open the IP address to check if the website display our own index page

# 3.0 MySQL

### 3.1 install MySQL 

```shell
sudo docker pull mysql
sudo docker run -d -p 3306:3306 --name mysql-container -e MYSQL_ROOT_PASSWORD=setup_password mysql

```



### 3.2 connect database with the instance IP with port 3306(make sure change the instance inbound/out bound rule. Add 3306 port)

### 3.3 import SQL file into the database



# 4.0 Redis

### 4.1 install Redis

```shell
sudo docker pull redis:3.0.5
sudo docker run -d --name myredis -p 6379:6379 redis
```

### 4.2 check container status

```shell
sudo docker ps
```



# 5.0 JDK

### 5.1 install JDK

```shell
sudo docker pull openjdk:17
sudo docker run -it --name myjdk openjdk:17

```

5.2 copy jar file into container

```shell
sudo docker cp service-system.jar myjdk:service-system.jar


```

# 6.0 Docker-compose

#### 6.1  document needed

​		1. html  								#replace nginx indexpage

​		2. docker-compose.yml       #docker-compose config file

​		3. Dockerfile						#build image for jar file 

​		4. nginx.conf						#using nginx for Reverse proxy send to backend

​		5. project.sql						#database data

​		6. service-system.jar

#### 6.2 upload files to EC2 /home/ubuntu

#### 6.3  install Docker-compose

```shell
sudo apt update
sudo apt install curl
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

```



#### 6.4  creating docker-compose.yml

```shell
version: "3"

services:
  nginx:
    image: nginx:latest
    ports:
      - 80:80
    volumes:
      - /home/ubuntu/html:/usr/share/nginx/html
      - /home/ubuntu/nginx.conf:/etc/nginx/nginx.conf
    privileged: true  

  mysql:
    image: mysql:latest
    ports:
    - 3306:3306
    environment:
    - MYSQL_ROOT_PASSWORD=51522Zzwlwlbb@
    volumes:
    - /home/ubuntu/dockerData/mysql/data:/var/lib/mysql
    - /home/ubuntu/dockerData/mysql/log:/var/log/mysql

  redis:
    image: redis:3.0.5

  service-system:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - 8800:8800
    depends_on:
      - mysql
      - redis

```



#### 6.5 creating nginx file for reverse proxy

```shell
worker_processes 1;

events {
    worker_connections 1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    keepalive_timeout  65;

    server {
        listen       80;
        server_name  localhost;

        location / {
            root   /usr/share/nginx/html;
			try_files $uri $uri $uri/ /index.html last;
            index  index.html index.htm;
        }
		location ^~ /prod-api/ {
			proxy_set_header Host $host;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			proxy_set_header X-Nginx-Proxy true;
			proxy_pass http://13.59.204.220:8800/;
		}

		
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}

```



#### 6.6 upload dist folder(front-end package) to /home/ubuntu/ and rename it as html

```shell
sudo mv dist html
```

#### 6.7 upload jar file to /home/ubuntu/

#### 6.8 creating Dockerfile to build image for jar file

```shell

FROM openjdk:17-jdk-hotspot

# copy jar file into container
COPY service-system.jar .

# intit command
CMD ["java", "-jar", "service-system.jar"]

```



#### 6.9 upload sql file to create database

#### 6.9 run docker-compose to start service

```shell
sudo docker-compose up -d
sudo docker ps
```



if there are 4 containers running, the service should be deployed successfully.

Paste IP address of the instance into web browser.

