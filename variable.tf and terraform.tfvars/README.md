# Terraform Variables

## Terraform tf files - variable.tf 

### Step1 Create a main.tf file

```
provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2AYK7R6PQ"
   secret_key = "S1Yg1Qm2JNSej8EHdhPTiu5l5ZD36URsedf32kNT"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0851b76e8b1bce90b"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.instance.id]
    tags = {
        Name = "Terraform EC2"
    }
}
resource "aws_security_group" "instance" {
    name = "terraform-example-instance"
     description = "Web Security Group"
    
    ingress {
    from_port = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}

    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}
```
### Step 2 create variable.tf

```
variable "instance_type" {
   description = "Instance type t2.micro"
   type        = string
   default     = "t2.micro"
}

``` 
Here is the sequence of terraform command which you need to run

```
terraform init

terraform plan

terraform apply
```

And finally you can destroy the complete environment using -
```
terraform destroy 
```


## Terraform tfvars file - terraform.tfvars

### step 1 Create a main.tf file

```
provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2AYK7R6PQ"
   secret_key = "S1Yg1Qm2JNSej8EHdhPTiu5l5ZD36URsedf32kNT"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0851b76e8b1bce90b"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.instance.id]
    tags = {
        Name = "Terraform EC2"
    }
}
resource "aws_security_group" "instance" {
    name = "terraform-example-instance"
     description = "Web Security Group"
    
    ingress {
    from_port = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}

    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}

```
Now create variable.tf but without any default values
```
variable "instance_type" {
}
```
Finally create terraform.tfvars
```
instance_type="t2.micro"
```

Here is the sequence of terraform command which you need to run

```
terraform init

terraform plan

terraform apply
```

And finally you can destroy the complete environment using -
```
terraform destroy 
```

## Terraform multiple tfvars file

There can be situation where you need create multiple tfvars files based on the environment like stage, production
So in such scenario you can create one tfvars file for each environment -

1. stage.tfvars
2. production.tfvars

### step 1 First Create your main.tf

```
provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2AYK7R6PQ"
   secret_key = "S1Yg1Qm2JNSej8EHdhPTiu5l5ZD36URsedf32kNT"
}
resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  var.instance_type

  tags = {
           Name = var.environment_name
   }

} 

resource "aws_security_group" "instance" {
    name = "terraform-example-instance"
     description = "Web Security Group"
    
    ingress {
    from_port = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}

    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}
```
### step 2  create your variable.tf

```
variable "instance_type" {
}

variable "environment_name" {
}
```

create your stage.tfvars for staging
```
instance_type="t2.micro"

environment_name ="stage" 
```

Apply the terraform configuration using following command -

```
terraform init
```
```
terraform plan -var-file="stage.tfvars"
```

And then
```
terraform apply -var-file="stage.tfvars"
```

destroy the environment by running following command
```
terraform destroy -var-file="stage.tfvars"
```
