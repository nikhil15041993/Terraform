Terraform data sources can be beneficial if you want to retrieve or fetch the data from the cloud service providers such as AWS, AZURE, and GCP.

![image](https://user-images.githubusercontent.com/87381349/160249242-ca8588ec-f855-4c09-ac79-5b936b87b936.png)


## 1. Create an aws_instance

```
provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2JMXVGYPG"
   secret_key = "ockvEN1DzYynDuKIh56BVQv/tMqmzvKnYB8FttSp"
}

resource "aws_instance" "ec2_example" {

   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"

   tags = {
           Name = "Terraform EC2"
   }
}
```

## 2. Define a data source

```
data "aws_instance" "myawsinstance" {
    filter {
      name = "tag:Name"
      values = ["Terraform EC2"]
    }BASH

    depends_on = [
      "aws_instance.ec2_example"
    ]
} 
```

## 3. Create Output variable for data source

```
output "fetched_info_from_aws" {
  value = data.aws_instance.myawsinstance
}
```

## 4. Apply the final terraform configuration along with data source and output values

```
provider "aws" {
    region     = "eu-central-1"
    access_key = "AKIATQ37NXB2JMXVGYPG"BASH
    secret_key = "ockvEN1DzYynDuKIh56BVQv/tMqmzvKnYB8FttSp"
}

resource "aws_instance" "ec2_example" {

    ami           = "ami-0767046d1677be5a0"
    instance_type =  "t2.micro"

    tags = {
      Name = "Terraform EC2"
    }
}

data "aws_instance" "myawsinstance" {
    filter {
        name = "tag:Name"
        values = ["Terraform EC2"]
    }

    depends_on = [
      "aws_instance.ec2_example"
    ]
}

output "fetched_info_from_aws" {
  value = data.aws_instance.myawsinstance.public_ip
}

```

You can simply run the following terraform command to create your aws_instance -
```
terraform init
```
```
terraform plan
```
```
terraform apply
```
