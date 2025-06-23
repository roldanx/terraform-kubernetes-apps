terraform {

  backend "local" {
  }

  ## default credentials file path: "~/.hcp/credentials.hcl"
  # backend "remote" {
  #   organization = "roldanx-corp"
  #   workspaces {
  #     name = "roldanx-workspace"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

data "aws_subnets" "example" {}

data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [[for s in data.aws_subnet.example : [s.id, s.cidr_block]]]
}
