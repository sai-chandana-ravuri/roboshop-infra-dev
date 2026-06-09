#!/bin/bash

# We are creating 50G root disk, but only 20G is partitioned.
# Remaining 30G we need to extend using below commands.
growpart /dev/nvme0n1 4
lvextend -r -L+30G /dev/mapper/RootVG-homeVol
xfs_growf /home


# We are installing terraform in bastion
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform


# creating databases
cd /home/ec2-user
git clone https://github.com/sai-chandana-ravuri/roboshop-infra-dev.git
chown ec2-user:ec2-user -R roboshop-infra-dev
cd roboshop-infra-dev/40-databases
terraform init
terraform apply -auto-approve

# creating components
cd /home/ec2-user
git clone https://github.com/sai-chandana-ravuri/roboshop-infra-dev.git
chown ec2-user:ec2-user -R roboshop-infra-dev
cd roboshop-infra-dev/90-components
terraform init
terraform apply -auto-approve