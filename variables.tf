variable "aws_region" {
    description = "AWS region"
    type        = string
    default     = "ap-south-1"
}

variable "enviornment" {
    description = "Env name (dev, staging, production)"
    type        = string  
}

variable "project_name" {
    description = "Project name"
    type        = string 
}

variable "vpc-cidr" {
    description = "VPC CIDR block"
    type        = string
    default     = "10.0.0.0/24"
}

variable "public-subnet-cidrs" {
    description = "Public subnet CIDR range"
    type        = list(string)
    default     = ["10.0.1.0/28", "10.0.2.0/28"]
}

variable "availability_zones" {
    description = "List of availability zones"
    type        = list(string)
    default     = ["ap-south-1a", "ap-south-1b"]
}
