output "aws_instance_public_ip" {
  value = aws_instance.nginxserver.public_ip
  description = "the publc ip for  ec2 instance"
}
output "aws_instance_ami" {
    value = aws_instance.nginxserver.instance_type
}
output "aws_instance_state" {
  value = aws_instance.nginxserver.instance_state
}
output "instance_url" {
 value = "http://${aws_instance.nginxserver.public_ip}"
  description = "url of nginx server"
}