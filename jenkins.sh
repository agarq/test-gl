#!/bin/bash
# run jenkins
mkdir -p /var/jenkins_home
chown -R 1000:1000 /var/jenkins_home/
chmod -R 777 /var/jenkins_home/
docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -d --name jenkins jenkins/jenkins:lts
echo 'Jenkins installed'
echo 'You should now be able to access jenkins at: http://'$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)':8080'