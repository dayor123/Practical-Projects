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
variable vpc_cidr_block {
  description = "VPC cidr block"
}
variable "subnet_cidr_block" {
  description = "subnet cidr block"
}
variable "avail_zone" {
  description = "availability zone"
}
variable "env_prefix" {
  description = "environment"
}


provider "aws" {
    region = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
}
# create a VPC 
resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    name: "${var.env_prefix}-vpc"
  }
}
# Subnet 
resource "aws_subnet" "myapp-subnet-1" {
  vpc_id     = aws_vpc.myapp-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.avail_zone
   tags = {
    name: "${var.env_prefix}-subnet-1"
  }
}
