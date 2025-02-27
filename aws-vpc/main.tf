terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# create a vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="My_Vpc"
  }
}
#private subnet
resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    "name" = "private subnet"
  }
}
#public subnet
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    "name" = "public subnet"
  }
}
#internet gateway
resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    name="my internet gateway"
  }
}
#routing table
# resource "aws_route_table" "my_route_table" {
#   vpc_id = aws_vpc.my_vpc.id
#   route = {
#     cidr_block="0.0.0.0/0"
#     gateway_id=aws_internet_gateway.my_gateway.id
#   }
# }
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.my_gateway.id
  }
}

resource "aws_route_table_association" "public_sub" {
  route_table_id = aws_route_table.my_route_table.id
  subnet_id = aws_subnet.public_subnet.id
}
#connect ec2_instance to vpc and subnets
resource "aws_instance" "myserver" {
ami=var.ami
instance_type = var.instance_type
subnet_id = aws_subnet.public_subnet.id

tags = {
  Name=var.tags
}
}