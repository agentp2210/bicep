#!/bin/bash
cd "$(dirname "$0")"

# Provision the infra
rg=$(az group list --query "[].name" -o tsv)
az deployment group create -g $rg --template-file linux-vm.bicep

# Install docker and run an nginx container on the created vm
hostname=$(az deployment group show -g $rg -n "linux-vm" --query properties.outputs.hostname.value -o tsv)
ssh -o StrictHostKeyChecking=no azureuser@$hostname 'bash -s' < install-docker.sh
ssh -o StrictHostKeyChecking=no azureuser@$hostname 'sudo docker run -d -p 8080:80 nginx'

# Try accessing the website publicly
echo "The URL is: $hostname:8080"

curl $hostname:8080
