terraform {
  backend "s3" {
    bucket = "my-terraform-bucket-967664"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}