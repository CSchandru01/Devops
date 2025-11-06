module "vpc" {
    source = "./moduls/vpc"
    
    vpc_cidr                = ["var.vpc_cidr"]
    availability_zone       = ["var.availability_zone"]
    demo_vpc_public_subnet  = ["var.demo_vpc_public_subnet"]
    demo_vpc_private_subnet = ["var.demo_vpc_private_subnet"]
    clucter_name            = "var.clucter_name"
  
}