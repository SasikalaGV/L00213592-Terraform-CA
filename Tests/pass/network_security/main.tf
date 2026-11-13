resource "aws_security_group" "secure_sg" {

  name        = "secure-sg"
  description = "Security Group for Sentinel Testing"

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "secure_instance" {

  ami           = "ami-0c1c30571d2dae5c9"
  instance_type = "t3.micro"

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "imdsv2-enabled"
  }
}