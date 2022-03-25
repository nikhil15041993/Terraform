# Terraform

Terraform by HashiCorp, an AWS Partner Network (APN) Advanced Technology Partner and member of the AWS DevOps Competency, is an “infrastructure as code” tool similar to AWS CloudFormation that allows you to create, update, and version your Amazon Web Services (AWS) infrastructure.

## 1. Installing Terraform

### 1.1 Install the Terraform using official Package distribution

Ubuntu

1 Update apt-get package manager
```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl 
```
2 Install official hashicorp repository
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```
```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" 
```
3 Install terraform
```
sudo apt-get update && sudo apt-get install terraform  
```

Centos

1 Install yum-config-manager
```
sudo yum install -y yum-utils 
```
2 Add official HashiCorp Linux repository
```
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
```
3 Install
```
sudo yum -y install terraform
```

