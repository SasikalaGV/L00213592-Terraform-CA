
terraform {
  cloud {
    organization = "ATU-DevOps-L00213592"

    workspaces {
      name = "L00213592-Terraform-CA2"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
}