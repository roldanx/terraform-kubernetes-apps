variable "deploy_module_params" {
  description = "Deployment module attributes map"
  type = object({
    deploy_module_name       = string
    deploy_module_namespace  = string
    deploy_module_image      = optional(string, "nginx:1.21.6")
  })
}

module "deploy" {
  source        = "terraform-iaac/deployment/kubernetes"
  name          = var.deploy_module_params.deploy_module_name
  namespace     = var.deploy_module_params.deploy_module_namespace
  image         = var.deploy_module_params.deploy_module_image
  internal_port = [
    {
      name          = "web-access"
      internal_port = "8080"
    }
  ]
}
