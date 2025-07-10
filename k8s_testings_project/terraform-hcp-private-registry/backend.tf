terraform {

# This config would be to execute runs and store tfstate in HCP 
#  cloud { 
#    organization = "roldanx-corp" 
#    workspaces { 
#      name = "roldanx-workspace" 
#    } 
#  } 

  backend "local" {
  }

  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.35.1"

    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }

}
