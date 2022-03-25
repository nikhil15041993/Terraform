# Terraform Input Variables

Terraform input variables provides an easy and more flexible way to define values so that we can change the configuration of the terraform as per our need.

### Types of Terraform Variables
There are two types of variables in Terraform -

* Simple values
* Collection Variable

### Simple Values variables

* string
* number
* bool

## Terraform Variables - string, number, bool

### string variable type 
```
variable "instance_type" {
   description = "Instance type t2.micro"
   type        = string
   default     = "t2.micro"
} 
```
Let’s replace the hardcoded value of instance_type with variable
```
instance_type = var.instance_type
```
```
provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2OBQHAALW"
   secret_key = "ilKygurap8zSErv7jySTDi2796WGqMkEtN6txNHf"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  var.instance_type

   tags = {
           Name = "Terraform EC2"
   }
}

variable "instance_type" {
   description = "Instance type t2.micro"
   type        = string
   default     = "t2.micro"
}

```
And now you can apply your terraform configuration
```
terraform apply 
```
### number variable type

```
variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 2
}  

```

```
provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2AYK7R6PQ"
   secret_key = "S1Yg1Qm2JNSej8EHdhPTiu5l5ZD36URs3ed2NyYT"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"
   count = var.instance_count

   tags = {
           Name = "Terraform EC2"
   }
}

variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 2
}

```
### boolean variable type

```
variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
}
```

```
provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2AYK7R6PQ"
   secret_key = "S1Yg1Qm2JNSej8EHdhPTiu5l5ZD36URs3ed2NyYT"
}


resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"
   count = 1
  associate_public_ip_address = var.enable_public_ip

   tags = {
           Name = "Terraform EC2"
   }

}

variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
}

```
