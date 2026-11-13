resource "aws_s3_bucket" "test_bucket" {
  bucket = "atul0012345-region-fail-test"

  tags = {
    Environment = "Fail"
  }
}