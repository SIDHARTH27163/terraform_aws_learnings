#connect ec2_instance to vpc and subnets
resource "aws_instance" "nginxserver" {
ami=var.ami
instance_type = var.instance_type
subnet_id = aws_subnet.public_subnet.id
vpc_security_group_ids = [ aws_security_group.nginx-sg.id ]
associate_public_ip_address = true

user_data = <<-EOF
           #!/bin/bash
           sudo yum install nginx-y
           sudo systemctl start nginx
           EOF

tags = {
  Name=var.tags
}
}