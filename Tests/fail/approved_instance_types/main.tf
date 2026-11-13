resource "aws_instance" "unapproved" {

  ami           = "ami-0c1c30571d2dae5c9"
  instance_type = "m5.24xlarge"

  tags = {
    Name = "unapproved-instance"
  }
}