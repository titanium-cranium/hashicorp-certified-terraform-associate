terraform {
  required_version = "~>1.0.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

provider "aws" {
  region = "us-west-1"
  profile = "default"
  alias = "aws-west-1"
}
