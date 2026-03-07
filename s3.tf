resource "aws_s3_bucket_versioning" "s3-version" {
  bucket = "my-terraform-bucket-96766"
    versioning_configuration {
        status = "Enabled"
    }
}
resource "aws_s3_bucket_ownership_controls" "bucker-owner" {
  bucket = "my-terraform-bucket-96766"
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}
resource "aws_s3_bucket_acl" "acl" {
  bucket = "my-terraform-bucket-96766"
    acl    = "private"
}
