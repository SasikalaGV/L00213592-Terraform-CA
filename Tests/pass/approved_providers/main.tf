provider "aws" {
  region = "eu-west-1"
}

provider "random" {}

resource "random_pet" "test" {
  length = 2
}