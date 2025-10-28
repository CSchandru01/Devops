terraform {
  required_providers {
    aws = {
        version = "~5.52.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "terraform_backend"
    key = "terraform.tfstate"
    region = "us-west-1"
    dynamodb_table = "backend_dynomodb"
    encrypt = true

  }
}