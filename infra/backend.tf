terraform {
  backend "s3" {
    bucket = "my-terraform-bucket-96766"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}