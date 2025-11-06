variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
}

variable "availability_zone" {
    description = "Availability zone"
    type = list(string)
}

variable "demo_vpc_public_subnet" {
    description = "Public subnet CIDR blocks"
    type = list(string)
}

variable "demo_vpc_private_subnet" {
    description = "Private subnet CIDR blocks"
    type = list(string)
  
}

variable "clucter_name" {
    description = "Cluster name"
    type        = string

}