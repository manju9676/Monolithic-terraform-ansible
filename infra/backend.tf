terraform {
  backend "s3" {
    bucket = aws_s3_bucket.s3.bucket
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}