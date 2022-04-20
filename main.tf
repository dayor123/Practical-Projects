terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.10.0"
    }
  }
}

variable "access_key" {
  description = "access key"
}
variable "secret_key" {
  description = "secret key"
}

provider "aws" {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
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
