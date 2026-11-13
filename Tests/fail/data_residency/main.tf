resource "aws_s3_bucket" "sensitive_data" {

  bucket = "atul0012345-data-residency-fail"

  tags = {
    data_residency = "usa"
    classification = "sensitive"
  }
}