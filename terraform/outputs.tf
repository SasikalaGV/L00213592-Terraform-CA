output "region" {
  value = var.aws_region
}

output "instance_type" {
  value = aws_instance.web.instance_type
}

