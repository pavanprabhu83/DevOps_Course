resource "aws_s3_bucket" "example" {
  bucket = "devops-course-pavan-s3-bucket-140924"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}