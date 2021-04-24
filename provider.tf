terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21"
    }
  }
}

provider "aws" {
  region     = "eu-west-1"
  access_key = "PUT_UR _ACCESSKEY"
  secret_key = "PUT_UR _ACCESSID"
}