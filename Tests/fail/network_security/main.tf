resource "aws_security_group" "bad_sg" {

  name        = "bad-sg"
  description = "Fails Sentinel checks"

  ingress {
    description = "Open SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bad_instance" {

  ami           = "ami-0c1c30571d2dae5c9"
  instance_type = "t3.micro"

  metadata_options {
    http_tokens = "optional"
  }

  tags = {
    Name = "imdsv1-enabled"
  }
}