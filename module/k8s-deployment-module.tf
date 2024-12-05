provider "kubernetes" {
  config_path    = "~/.kube/config"
}

variable "deploy_module" {
  description = "Deployment module attributes"
  type = list(object({
    deploy_module_name       = string
    deploy_module_namespace  = string
    deploy_module_image      = optional(string, "nginx:1.21.6")
  }))
}

# ANCIENT VARIABLES
# variable "deploy_name" {
#   description = "Deployment name"
#   type        = string
#   default     = "deploy-module-nginx"
# }
# 
# variable "deploy_namespace" {
#   description = "Deployment namespace"
#   type        = string
# }

module "deploy" {
  count = 2

  source        = "terraform-iaac/deployment/kubernetes"
  name          = var.deploy_module["${count.index}"].deploy_module_name
  namespace     = var.deploy_module["${count.index}"].deploy_module_namespace
  image         = var.deploy_module["${count.index}"].deploy_module_image
  internal_port = [
    {
      name          = "web-access"
      internal_port = "8080"
      host_port     = "8${count.index}"
    }
  ]
}

#module "test-deploy" {
#  source        = "terraform-iaac/deployment/kubernetes"
#  name          = "test-nginx-deploy"
#  namespace     = var.deploy_module[0].deploy_module_namespace
#  image         = var.deploy_module[0].deploy_module_image
#  internal_port = [
#    {
#      name          = "web-access"
#      internal_port = "8080"
#      host_port     = "88"
#    }
#  ]
#}