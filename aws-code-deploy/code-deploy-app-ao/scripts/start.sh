#!/bin/bash

sudo java -jar /opt/app/admin-server-0.0.1.jar | sudo tee -a /home/ec2-user/app.log &
exit 0
