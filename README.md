# Karaf-Dockerfile
Dockerfile and appropriate files to create a Ubuntu32 instance with a custom installation of Apache Karaf with two test camel contexts.

Enter proxy host in 'myconfig.py'

Download the required base image to your docker images repository and amend the first line of the Dockerfile to use the desired base image.


Run in Docker:

sudo docker build -t myrepository/myfolder:mytag path/to/Dockerfile
sudo docker run -it --name=containername myrepository/myfolder:mytag
