variable "region" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "us-east-1"
  
}
variable "vpc_cidr" {
  description = "cidr block for VPC"
  type = string
  default = "10.0.0.0/16"
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

variable "demo_instance_ami" {
    description = "AMI ID for the demo EC2 instance"
    type        = string
  
}

variable "demo_instance_type" {
    description = "Instance type for the demo EC2 instance"
    type        = string
    default     = "t2.micro"
}

variable "instace_count" {
    description = "Number of EC2 instances to launch"
    type        = number
    default     = 1
} 
variable "key_name" {
    description = "Key pair name for EC2 instances"
    type        = string
  
}