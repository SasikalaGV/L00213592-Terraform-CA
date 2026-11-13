resource "aws_s3_bucket" "region_pass" {

  bucket = "atul0012345-approved-region-pass"

  tags = {
    Environment = "Pass"
    Region      = "Ireland"
  }
}