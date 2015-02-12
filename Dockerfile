#specify base image
FROM ggrandes/ubuntu32:14.04

#set proxy for base machine
COPY myconfig.py /proxy-settings/myconfig.py
COPY baseproxy.py /proxy-settings/baseproxy.py
RUN /proxy-settings/baseproxy.py

#update packages and install java and maven
RUN apt-get update && apt-get install -y nano openjdk-7-jdk maven

#set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-i386
ENV PATH $PATH:$JAVA_HOME/bin

#set the maven proxy
COPY mavenproxy.py /proxy-settings/mavenproxy.py
RUN /proxy-settings/mavenproxy.py

#copy karaf pom from the context
COPY pom.xml /opt/customkaraf/pom.xml

#set the JAVA_HOME, move to the customkaraf directory and package the maven project
RUN export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-i386; cd /opt/customkaraf; mvn package

#unzip the new karaf file
RUN cd /opt/customkaraf; unzip /opt/customkaraf/target/apache-karaf-caravan-3.0.2.zip


#copy camels into the karaf deploy folder
COPY camels /opt/customkaraf/apache-karaf-caravan-3.0.2/deploy/ 

#make the container start up by running karaf
ENTRYPOINT ["/opt/customkaraf/apache-karaf-caravan-3.0.2/bin/karaf"]
