terraform {
  cloud {
    organization = "roldanx-corp"
    workspaces {
      name = "roldanx-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"
  access_key  = "<aws-access-key>"
  secret_key  = "<aws-secret-key>"
}

data "aws_subnets" "example" {}

data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [[for s in data.aws_subnet.example : [s.id, s.cidr_block]]]
}
