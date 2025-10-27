output "vpc_id" {
    description = "The ID of the VPC"
    value       = aws_vpc.main.id
}

output "vpc_cidr" {
    description = "The CIDR block of the VPC"
    value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
    description = "List of public subnet IDs"
    value       = aws_subnet.public.*.id
}

output "public_subnet_cidrs" {
    description = "List of public subnet CIDR blocks"
    value       = var.public-subnet-cidrs
}

