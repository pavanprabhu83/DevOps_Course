resource "aws_s3_bucket" "example" {
  bucket = "devops-course-pavan-s3-bucket-140924"

  tags = {
  Name        = "My bucket"
    Environment = "Dev"  
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "s3_bucket_id" {
  value = aws_s3_bucket.example.id
}