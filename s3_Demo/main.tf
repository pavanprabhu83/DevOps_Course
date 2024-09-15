resource "aws_s3_bucket" "my_bucket" {
  bucket = "devops-course-pavan-s3-bucket-140924"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning_my_bucket" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "s3_bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}