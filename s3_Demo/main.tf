resource "aws_s3_bucket" "terraform_backend" {
  bucket = "DevOps_Sept2024_terraform_backend_EC2"

  tags = {
  Name        = "Terraform state file"
    Environment = "Dev"  
  }
}

resource "aws_s3_bucket_versioning" "versioning_terraform_backend" {
  bucket = aws_s3_bucket.terraform_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "s3_bucket_id" {
  value = aws_s3_bucket.terraform_backend.id
}