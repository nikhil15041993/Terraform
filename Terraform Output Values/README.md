
Terraform output values can help you to print the attributes reference(arn, instance_state, outpost_arn, public_ip, public_dns etc) on your console.

syntax of Terraform output values is -

```
output "my_console_output" {
  value = "hellooooooo"
} 

```
Once you run your terraform apply command, it is going to print Hello this is output onto your console.


## print the public_ip of aws_instance

main.tf

```
provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXB2G2LXXXXX"
   secret_key = "r1oaShokKPw+YY7qaHxj8mD2T8BpxRUVXXXXXXXX"
}

resource "aws_instance" "ec2_example" {
   
   ami           = "ami-0767046d1677be5a0"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.staging-subnet.id
   
   tags = {
           Name = "test - Terraform EC2"
   }
}
```
You can simply append following terraform output value code inside your main.tf file so that it can print the public ip of your aws_instance
```
output "my_console_output" {
  value = aws_instance.ec2_example.public_ip
} 
```
here we created the terraform output values inside the same main.tf file.

## create output.tf for terraform output values

In this method we create a separate output.tf specially of the terraform output values, so that all the output values can be stored there.

output.tf
```
output "my_console_output" {
  value = aws_instance.ec2_example.public_ip
} 
```
