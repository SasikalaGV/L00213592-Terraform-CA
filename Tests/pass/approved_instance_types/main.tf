resource "aws_instance" "approved" {

  ami           = "ami-0c1c30571d2dae5c9"
  instance_type = "t3.micro"

  tags = {
    Name = "approved-instance"
  }
}
