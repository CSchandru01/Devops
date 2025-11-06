output "vps_id" {
    description = "The ID of the VPC"
    value       = aws_vpc.demo_vpc.id
  
}

output "demo_vpc_public_subnet" {
    description = "public subnet id"
    value = demo_vpc_public_subnet[*].id
}
output "demo_vpc_private_subnet" {
    description = "value"
    value = demo_vpc_private_subnet[*].id
}