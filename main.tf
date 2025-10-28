terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }
}

backend "s3" {
  bucket = "your-terraform-state-bucket"
  key = "vpc/terraform.tfstate"
  region = "ap-south-1"
  encrypt = true
  dynamodddb_table = "terraform-state-lock"
}

provider "aws" {
    region = var.aws_region

    default_tags {
        tags = {
            enviornment = var.enviornment
            Managedby = "Terraform"
            Project = var.project_name
        }
    }
}

# VPC
resource "aws_vpc" "main" {
    cidr_block = var.vpc-cidr
    enable_dns_hostnames = true
    enable_dns_support = true
}

# Public subnets
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    count = length(var.public-subnet-cidrs)
    cidr_block = var.public-subnet-cidrs[count.index]
    availability_zone = var.availability_zones[count.index]
    
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.project_name}-${var.enviornment}-public"
        Type = "Public"
    }
}


