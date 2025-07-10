provider "kubernetes" {
  config_path = "/home/roldanx/.kube/config"
#   config_context = "kind-kind"
}

module "apps" {
  source  = "app.terraform.io/roldanx-corp/apps/kubernetes"
  namespace = "tf"
  pod_image = "nginx:1.21.5"
  version = "v1.1.0"
}

data "kubernetes_nodes" "nodes" {}