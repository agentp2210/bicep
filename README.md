# Tran-An-Knab
My solution includes 3 files
**linux-vm.bicep:** 
This script is to provision the infra including: 
NIC: to be used by the VM
publicIPAddress: to be used by the VM
NSG: with 2 ports open. Port 22 for ssh and port 8080 to expose the app
VNET: with address Prefix '10.1.0.0/16'
Subnet: with Address Prefix '10.1.0.0/24'
VM: to host the nginx container

**install-docker.sh**
To be run remotely on the VM and install docker

**one-step.sh**
To trigger other scripts and set up everything

**NOTE:**
*This solution is simple and secured enough to fulfil the requirements of the challenge.*
*However, in real project situation, I would choose a different approach to provision the infra and deploy the containerized applications. The stack would include "AKS, ACR, Key Vault, Helm, ArgoCD, nginx-ingress, cert-manager, prometheus, grafana, EFK, Terraform, Ansible, Azure DevOps"*


# Instruction

1. Open Azure Cloud Shell or log in to azure from the command line
```shell
az login
```

2. Run the script and provide the password you want to use for the VM
```shell
./one-step.sh
```

3. Sit back and relax

*Hope you guys enjoy the solution*