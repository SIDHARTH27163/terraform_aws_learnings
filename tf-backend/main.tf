terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    
  }
  backend "s3" {
    bucket = "value"
    key = "backend.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


# random porvider
/*
genrate random indentifiers or unique identifier
uses : Random Provider in Terraform
genrates random numbers
*/

