resource "aws_instance" "web" {

  ami                    = "ami-0c1c30571d2dae5c9"
  instance_type          = "t3.micro"

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "sovereign-web"
  }
}