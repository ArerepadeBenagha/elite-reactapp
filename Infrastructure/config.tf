terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 0.14"

  backend "remote" {
    organization = "EliteSolutionsIT"

    workspaces {
      name = "elite-buildRelease_fbreactapp"
    }
  }
}

terraform {
  required_version = ">=0.12"
}
provider "aws" {
  region = "us-east-1"
}