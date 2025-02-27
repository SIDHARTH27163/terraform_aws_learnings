output "aws_instance_public_ip" {
  value = aws_instance.myserver.public_ip
}
output "aws_instance_ami" {
    value = aws_instance.myserver.instance_type
}
output "aws_instance_state" {
  value = aws_instance.myserver.instance_state
}