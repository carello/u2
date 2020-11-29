# https://www.terraform.io/docs/backends/types/remote.html

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "carello"

    workspaces {
      name = "u2"
    }
  }
}


provider "aws" {
  region     = var.my_region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_s3_bucket" "test" {
  bucket_prefix = "test-"
}


