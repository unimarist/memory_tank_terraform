terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">=0.12"
}


provider "aws" {
  region = "ap-northeast-1"
  profile = "omura_profile"
}