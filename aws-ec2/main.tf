terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "myserver" {
ami="ami-016038ae9cc8d9f51"
instance_type = "t3.micro"
tags = {
  Name="SampleServer"
}
}
