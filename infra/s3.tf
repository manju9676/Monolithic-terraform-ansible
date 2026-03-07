data "aws_s3_bucket" "s3" {
  bucket = "my-terraform-bucket-967664"
}
resource "aws_s3_bucket_versioning" "s3-version" {
  depends_on = [data.aws_s3_bucket.s3]
  bucket     = data.aws_s3_bucket.s3.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_ownership_controls" "bucker-owner" {
  depends_on = [data.aws_s3_bucket.s3]
  bucket     = data.aws_s3_bucket.s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "acl" {
  depends_on = [data.aws_s3_bucket.s3]
  bucket     = data.aws_s3_bucket.s3.id
  acl        = "private"
}
