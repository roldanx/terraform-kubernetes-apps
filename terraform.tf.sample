terraform {

## Uncomment to execute runs and store tfstate in local # DEFAULT BACKEND
#  backend "local" {
#  }

## Uncomment to store tfstate in HCP 
## This backend can optionally execute runs too if configured in HCP GUI

#  cloud { 
#    organization = "roldanx-corp" 
#    workspaces { 
#      name = "roldanx-workspace" 
#    } 
#  } 

## Uncomment to store tfstate in HCP or other remote backend
## This backend can optionally execute runs too if configured in HCP GUI
#  backend "remote" {
#    hostname = "app.terraform.io" # -> This config is equivalent to "cloud" backend
#    organization = "roldanx-corp"
#    workspaces {
#      name = "roldanx-workspace"
#    }
#  }

## Uncomment to store tfstate in kubernetes
#  backend "kubernetes" {
#    config_path   = "~/.kube/config"
#    namespace     = "default"
#    secret_suffix = "nginx-app"
#  }

#  required_providers {
#    kubernetes = {
#      source = "hashicorp/kubernetes"
#      version = "2.35.1"
#    }
#    random = {
#      source  = "hashicorp/random"
#      version = "3.6.3"
#    }
#  }

}