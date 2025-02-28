# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
}

# Fetch the AWS AMI based on a name or filter
data "aws_ami" "name" {
  most_recent = true
  owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["*your-ami-name*"]  # Replace with the correct AMI name or a pattern
#   }
}

output "aws-ami" {
  value = data.aws_ami.name.id  # Access the AMI ID to output it
}

resource "aws_instance" "myserver" {
  ami           = data.aws_ami.name.id  # Use the AMI from the data source
  instance_type = "t3.micro"
  tags = {
    Name = "SampleServer"
  }
}
