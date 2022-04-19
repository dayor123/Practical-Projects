terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.10.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = "AKIAVY6M54F565SRM3CR"
    secret_key = "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"
}
# create a VPC 
resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"
}
# Subnet 
resource "aws_subnet" "dev-subnet-1" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone ="us-east-1a"
}
