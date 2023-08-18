## Reusing code using module

Let’s first create the root/main module source code and test if it is able to deploy a machine. 

```
resource "aws_instance" "myec2" {
        ami             = var.custom_ami_id
        instance_type   = var.instance_hw
        tags = {
                Name    = var.aws_ec2_name
                }
        key_name        = var.aws_key_name
        }

#### DEFINING VARIABLE DECLARATION #######

variable "instance_hw" {
        default = "t2.micro"
        }

variable "aws_ec2_name" {}

variable "custom_ami_id" {
        default = "ami-06a0b4e3b7eb7a300"
        }

variable "aws_key_name" {
        default = "aws-exam-testing"
        }

output "awsip" { value = aws_instance.myec2.public_ip }
#### END - DEFINING VARIABLE DECLARATION ##########

```

Test the code by issuing “terraform apply”

Now create a basic child module referencing the values you require and test if it is working fine for you. Remember to provide correct source path, else child module will not be able to find the location of parent module.


```
module "ec2module" {
        source = "../../tmp/puppet/"
        custom_ami_id = "ami-06a0b4e3b7eb7a300"
        aws_ec2_name = var.aws_ec2_name
                }

variable "aws_ec2_name" {}

output "awsip" { value = module.ec2module.awsip }
```
