provider "aws" {
  region = "eu-west-1"
}

provider "random" {}

resource "random_pet" "bad_provider_test" {
  length = 2
}