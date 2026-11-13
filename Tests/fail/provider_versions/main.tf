provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "version_test" {
  bucket = "atul0012345-version-fail-test"
}