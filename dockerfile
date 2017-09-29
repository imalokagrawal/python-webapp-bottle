FROM ubuntu

# create user
RUN groupadd web
RUN useradd -d /home/bottle -m bottle

# make sure sources are up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# install pip
RUN apt-get install python-pip -y
# ADD server.py /home/bottle/server.py
RUN pip install bottle

# expose ports
EXPOSE 8080
#ENTRYPOINT ["/usr/bin/python", "/home/bottle/server.py"]
USER bottle
