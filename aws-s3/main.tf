terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random={
        source = "hashicorp/random"
        version = "3.6.2"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}
resource "random_id" "random_id" {
byte_length = 8
  
}
resource "aws_s3_bucket" "demo-aws_s3_bucket" {
  bucket = "demo-bucket-${random_id.random_id.hex}"
}

resource "aws_s3_object" "bucket_data" {
  bucket = aws_s3_bucket.demo-aws_s3_bucket.bucket
  key    = "mydata.txt"    
  source = "./myfile.txt"   
}

# random porvider
/*
genrate random indentifiers or unique identifier
uses : Random Provider in Terraform
genrates random numbers
*/

