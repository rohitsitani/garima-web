# Working with AWS EC2

## Step 1: Create account 

account is free for 12 months for a total of 750 cumulative hours in a month. Credit card needs to be entered to setup the account. Existing gmail account can be used with the option of including a + at the end of existing email address which is ignored by google. 

## Step 2: Create Instance

Instance is created using AWS web console and selecting the free instances, and also allowing my ip (or allow everything if it does not connect to port 22, 8080, 443) to access the instance as a security measure. The private key generates will be later used to connect to the instance. 

## Step 3: Connect to Instance (RHEL)

Connect to instance can be done via ssh client or terminal. 
You need to select the IP address from the info in the instance listed in web AWS console or click on connect button after selecting the checkbox of the instance

- ssh -i ~/Downloads/"rohitsitani+aws2.pem" ec2-user@ec2-18-136-194-169.ap-southeast-1.compute.amazonaws.com

This file is in the drive of rohitsitani@gmail.com under development folder

## Step 4: Manage Instance

Instance once terminated cannot be brought up. Hence only stop the instance if we are not using. Once started again the IP and the dynamic domain containing the IP will also change on every stop and start

## Step 5:  install java, tomcat, edit security AWS: 

<https://devops4solutions.com/installation-of-tomcat-on-aws-ec2-linux-integration-with-jenkins/>

## Step 6: SCP from local to AWS: 

- scp -i "rohitsitani-ec2-keypair.pem" <any file in local> ec2-user@54.255.179.216:/tmp

## Step 7: This step is only for AWS linux2 instance as AWS RHEL 8 does not support docker

### 7.1 EC2 setup commands which are executed one time per instance

- sudo yum update -y
- sudo yum install docker -y
- sudo service docker status
- sudo service docker start
- sudo usermod -a -G docker ec2-user
- sudo yum install git -y
- sudo service docker start
- git clone <repo link>
- cd web-example
- sudo sh shell.sh
- git into docker container: docker exec -ti $(docker ps -q) /bin/bash

### 7.2 commands used for every connect

- ssh -i ~/Downloads/"rohitsitani+aws2.pem" ec2-user@ec2-18-136-194-169.ap-southeast-1.compute.amazonaws.com

### 7.3 docker commands

- service docker start
- docker images 

> get list of docker images created

- docker ps

> get running docker process information

- docker ps -q

> docker get running container name

- docker run -p 8080:8080 web-example &

- docker logs $(docker ps -q)

> usually the tomcat catalina logs only. Will not show the other logs like application logs. Need to figure that out

- docker kill $(docker ps -q)

- docker exec -ti $(docker ps -q) /bin/bash

> docker get into container. This is useful to get into the docker running instance and you may change code directly, or look at logs

- docker attach $(docker ps -q)

> docker attach to running docker image. when ctrl c is used, the docker run is exited. its like the background run is brought to foreground.

## Reference

<https://www.cprime.com/resources/blog/deploying-your-first-web-app-to-tomcat-on-docker/>

# web-example

web examples for selenium. This is the actual project readme file from here.

### Command:

- cd web-example
- sh shell.sh

### deploy to docker on AWS and acess tomcat manager (tomcat-users.xml copied into tomcat as part of Dockerfile)
http://ec2-18-136-194-169.ap-southeast-1.compute.amazonaws.com:8080/manager/

### deploy to docker on AWS and then access it using below URL
http://ec2-18-136-194-169.ap-southeast-1.compute.amazonaws.com:8080/web-example/

### deploy to docker on AWS and then run python commands
web-example/python
