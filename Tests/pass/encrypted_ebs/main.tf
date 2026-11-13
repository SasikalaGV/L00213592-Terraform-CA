resource "aws_instance" "encrypted" {

  ami           = "ami-0c1c30571d2dae5c9"
  instance_type = "t3.micro"

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "encrypted-ebs"
  }
}