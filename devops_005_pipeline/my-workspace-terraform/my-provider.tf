terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = AKIAVQUQZ6ZRXAW7RPKO
  secret_access_key = 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
}

