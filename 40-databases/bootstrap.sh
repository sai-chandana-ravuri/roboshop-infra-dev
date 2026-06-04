# We will insatll ansible here and configure mongodb. Copy this script to mongodb, execute trhough remote-exec

#!/bin/bash

component=$1
dnf install ansible -y

cd /home/ec2-user
git clone https://github.com/sai-chandana-ravuri/ansible-roboshop-roles-tf.git

cd ansible-roboshop-roles-tf

git pull

ansible-playbook -e component=$component roboshop.yaml