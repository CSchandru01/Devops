
# create s3 bucket for terraform backend state file
resource "aws_s3_bucket" "terraform_backend" {
  bucket = "my-terraform-backend"

 # prevent bucket from being destroyed accidentally
  lifecycle {
    prevent_destroy = false
  }
  
  #tags for the bucket
  tags = {
    Name        = "Terraform Backend Bucket"
    Environment = "Dev"
  }  
}

# enable versioning for the s3 bucket
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

# enable server side encryption for the s3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# create dynamodb table for terraform backend locking
resource "aws_dynamodb_table" "backend_dynomodb" {
  name         = "terraform-backend-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Backend Locks"
    Environment = "Dev"
  }
}