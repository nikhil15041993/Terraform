# Terraform create EC2 Instance on AWS

## Table of Content

* Setup AWS Account
* Generate Access keys (access key ID and secret access key)
* Create your first Terraform infrastructure (main.tf)
* terraform commands

## 1. Setup AWS Account

Setup an AWS EC2 instance the first step would be to create an AWS account.
Sign up for AWS account
Goto https://aws.amazon.com/ and click on Complete sign-up

## 2. Generate Access keys (access key ID and secret access key)

For authentication, we need to generate Access Keys (access key ID and secret access key). These access keys can be used for making - programmatic calls to AWS from the AWS CLI, Tools for PowerShell, AWS SDKs, or direct AWS API calls.

## 3. Create your first Terraform infrastructure (main.tf)

You need to save your configuration with .tf extension
We will start by creating an empty main.tf file.

### Provider

The first line of code in which we are going to write is provider.

We need to tell terraform which cloud provider we are going to connect .e.g - AWS, Google, or Azure

This is how our final main.tf will look like for AWS -
```
provider "aws" {
  region     = "eu-central-1"
  access_key = "XXXXXXXXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
} 
```

###  resource - “aws_instance”

Resource - It is something that we are going to provision/start on AWS.

* ami = you need to tell Terraform which AMI(Amazon Machine Image) you are going to use. Is it going to be Ubuntu, CentOS or something else
* instance_type = Also based on your need you have to choose the instance_type and it can be t2.nano, t2.micro, t2. small etc.

```
resource "aws_instance" "ec2_example" {
    ami = "ami-0767046d1677be5a0"  
    instance_type = "t2.micro" 
    tags = {
        Name = "Terraform EC2"
    }
}
```

## 4. terraform commands

The first command which we are going to run is -


### terraform init

```
terraform init 
```
```
Initializing the backend...

Initializing provider plugins...
- Reusing the previous version of hashicorp/aws from the dependency lock file
- Installing hashicorp/aws v3.32.0...
- Installed hashicorp/aws v3.32.0 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary 
```

The terraform init command is responsible for downloading all the dependencies which are required for the provider AWS.

Once you issue the terraform init command it will download all the provider’s dependencies on your local machine.


### terraform plan


Here is the command -
```
terraform plan 
```

```
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.ec2_example will be created
  + resource "aws_instance" "ec2_example" {
      + ami                          = "ami-0767046d1677be5a0"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = (known after apply)
      + outpost_arn                  = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + secondary_private_ips        = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Name" = "Terraform EC2"
        }
      + tenancy                      = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run. 

```
As you can see the output of terraform plan, at the end it will show all the resources added and deleted.

### terraform apply

This command will do some real stuff on AWS. Once you will issue this command, it will be going to connect to AWS and then finally going to provision AWS instance.

```
terraform apply 
```

```
Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.ec2_example: Creating...
aws_instance.ec2_example: Still creating... [10s elapsed]
aws_instance.ec2_example: Still creating... [20s elapsed]
aws_instance.ec2_example: Still creating... [30s elapsed]
aws_instance.ec2_example: Creation complete after 33s [id=i-0a948ac635a2010f1]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed. 

```
### terraform destroy

Let see how to remove or delete everything from AWS.

We are going to use the command -
```
terraform destroy 
```

```
Plan: 0 to add, 0 to change, 1 to destroy.

Do you want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.ec2_example: Destroying... [id=i-0a948ac635a2010f1]
aws_instance.ec2_example: Still destroying... [id=i-0a948ac635a2010f1, 10s elapsed]
aws_instance.ec2_example: Still destroying... [id=i-0a948ac635a2010f1, 20s elapsed]
aws_instance.ec2_example: Still destroying... [id=i-0a948ac635a2010f1, 30s elapsed]
aws_instance.ec2_example: Still destroying... [id=i-0a948ac635a2010f1, 40s elapsed]
aws_instance.ec2_example: Destruction complete after 40s

Destroy complete! Resources: 1 destroyed. 

```
