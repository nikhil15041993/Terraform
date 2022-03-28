output "Public_ip" {
  value = data.aws_instance.myawsinstance.public_ip

}

output "instance_state" {
  value = data.aws_instance.myawsinstance.instance_state

}
