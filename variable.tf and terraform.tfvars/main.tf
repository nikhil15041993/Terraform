provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
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
