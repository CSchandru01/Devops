module "vpc" {
    source = "./moduls/vpc"
    
    vpc_cidr                = ["var.vpc_cidr"]
    availability_zone       = ["var.availability_zone"]
    demo_vpc_public_subnet  = ["var.demo_vpc_public_subnet"]
    demo_vpc_private_subnet = ["var.demo_vpc_private_subnet"]
    clucter_name            = "var.clucter_name"
  
}

module "ec2" {
    source = "./moduls/ec2"
    
    demo_instance_ami   = "var.demo_instance_ami"
    demo_instance_type  = "var.demo_instance_type"
    instace_count       = "var.instace_count"
    key_name            = "var.key_name"
    clustername         = "var.clucter_name"
  
}