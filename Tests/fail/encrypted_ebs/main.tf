resource "aws_instance" "unencrypted" {

  ami           = "ami-0c1c30571d2dae5c9"
  instance_type = "t3.micro"

  root_block_device {
    encrypted = false
  }

  tags = {
    Name = "unencrypted-ebs"
  }
}