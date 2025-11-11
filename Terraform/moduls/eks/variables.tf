variable "cluster_name" {
    description = "The name of the EKS cluster"
    type        = string
}

variable "eks_version" {
    description = "The Kubernetes version for the EKS cluster"
    type        = string
    default     = "1.21"
}

variable "vpc_id" {
    description = "The VPC ID where the EKS cluster will be deployed"
    type        = string
  
}

variable "subnet_ids" {
    description = "List of subnet IDs for the EKS cluster"
    type        = list(string)
}

variable "node_groups" {
    description = "Map of node group configurations"
    type = map(object({
        instance_types = list(string)
        capacity_type = string
        scaling_config = object({
            desired_size   = number
            min_size       = number
            max_size       = number
        })
        
    }))
}

