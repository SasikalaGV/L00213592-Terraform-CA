resource "aws_s3_bucket" "sensitive_data" {

  bucket = "atul0012345-data-residency-pass"

  tags = {
    data_residency = "ireland"
    classification = "sensitive"
  }
}
