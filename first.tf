terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.51.0"
    }
  }
}

provider "aws" {
  access_key = "foo"
  secret_key = "bar"
  region     = "us-east-1"
}



