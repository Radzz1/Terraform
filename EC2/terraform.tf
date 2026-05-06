terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.67.0"
    }
  }

  backend "s3" {
    bucket = "terra-bucket-test-db"
    key = "terraform.tfstate"
    region = "ap-southeast-2"
    use_lockfile = true
    encrypt = true
  }
}

