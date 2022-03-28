terraform {
  required_version = ">=0.12"
}

provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
} 

resource "aws_instance" "ec2_example" {
    ami = "ami-0851b76e8b1bce90b"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.instance.id]
    
user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y default-jre
      sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
      sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
      sudo apt-get update
      sudo mkdir testing
      sudo mkdir testing2
      sudo apt-get install -y  jenkins 
      EOF

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






resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa B3NzaC1yc2EAAAADAQABAAABgQCuec0y13rFp+1rN6lwmQwG4RjZ8ggqstlsn5hcarRgEP5J1YMOnhYWH8VXCmdm3Qv0GlA4WXrqyuPm26n8RwkbHXmPCPmDEfBex9nK//+OZSTgl4LBOwcLtROZd5uCFKO8HVuSe4ddZaNPvGopRrZKbeKsCBNX2/Vq/GkOa+8g4i61IXtRSKbl7l7qBXiDV/dyLJk23QZfjnpWOGriVkt74JfAIQZonaqqAPK15TqMj0kOC012CCBKiJbnMDnCBfAw2IcvipsD1On87Q9TZ42TiLTFZXOVhJagxKg7I9dGsT6kHPZB0287jlXhiluAj3DuUjj3EJ/9ogGmB7pO/h24S+KuEMNTboXHjYQxmI0ds1TrjZr4VtYSMb51cGUklAtHebFsQHL+qZt5jVvwjBJnQdV00R34ItZKAmcmjQF85UX1ruqdKCwzSftIx5lw5WrYugK/DtDLtqIunhVVJdwnYbiMPR3ZH8wdargTMpPS/e27u00e54lmqXO19YS31t0= nikhils@NDZ-LNX-003"
}
