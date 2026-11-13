output "region" {
  value = var.aws_region
}

output "instance_type" {
  value = aws_instance.web.instance_type
}

output "ebs_encrypted" {
  value = aws_ebs_volume.data.encrypted
}