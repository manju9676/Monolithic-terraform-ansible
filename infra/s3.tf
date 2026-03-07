resource "aws_s3_bucket" "s3" {
  bucket = "my-terraform-bucket-967664"
}
resource "aws_s3_bucket_versioning" "s3-version" {
  depends_on = [ aws_s3_bucket.s3 ]
  bucket = aws_s3_bucket.s3
      versioning_configuration {
        status = "Enabled"
    }
}
resource "aws_s3_bucket_ownership_controls" "bucker-owner" {
  depends_on = [ aws_s3_bucket.s3 ]
  bucket = aws_s3_bucket.s3
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}
resource "aws_s3_bucket_acl" "acl" {
  depends_on = [ aws_s3_bucket.s3 ]
  bucket = aws_s3_bucket.s3
    acl    = "private"
}
