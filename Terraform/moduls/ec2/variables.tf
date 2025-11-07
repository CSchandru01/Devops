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
    description = "Number of EC2 instances to create"
    type        = number
    default     = 1
}

variable "key_name" {
  description = "key name "
    type        = string
}

variable "clustername" {
  description = "Cluster name for tagging resources"
    type        = string
}