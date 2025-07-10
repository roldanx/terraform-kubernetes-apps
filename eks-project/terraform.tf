# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  # Backend configured so Terraform Cloud logs into AWS by using dynamic credentials as stated here:
  # https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/security.html#iam-roles [Use dynamic credentials for HCP Terraform workspaces] 
  # https://github.com/hashicorp/terraform-dynamic-credentials-setup-examples/tree/main/aws
  cloud {
    organization = "roldanx-corp" 
    workspaces { 
      name = "aws-workspace" 
    } 
  } 

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.5"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.4"
    }
  }

  required_version = "~> 1.3"
}
