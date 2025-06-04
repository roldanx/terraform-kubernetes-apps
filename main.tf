resource "random_pet" "instance" {
  count = 2
  length = 2
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_pod" "pod" {
  count = 1
  metadata {
    name      = random_pet.instance[count.index].id
    namespace = kubernetes_namespace.namespace.metadata[0].name
    labels = {
      version = "v2"
    }
  }
  spec {
    container {
      image = var.pod_image
      name  = "nginx-terraform"
      env {
        name  = "environment"
        value = "dev"
      }
      port {
        container_port = 80
      }
      resources {
        requests = {
          cpu    = "100m"
          memory = "200Mi"
        }
        limits = {
          cpu    = "150m"
          memory = "256Mi"
        }
      }
    }
  }

  depends_on = [random_pet.instance, kubernetes_namespace.namespace]
}


# Think of your terraform as a programming function. You have values you can pass to it. Those are like tf variables. 
# Then, you have variables inside the function that do various things, but are not a part of the interface. Consumers 
# of your function wouldn't know anything about those private internal variables. Those are like tf locals.
locals {
  deploy_module_attributes = {
  deploy_module_GOD = {
    local_name      = "nginx-module-god"
    local_ns = kubernetes_namespace.namespace.metadata[0].name
    },
  deploy_module_SATAN = {
    local_name      = "nginx-module-satan"
    local_ns = kubernetes_namespace.namespace.metadata[0].name
    }
  }
}

module "deployment_module" {
  source = "./custom_child_module"
  
  for_each = local.deploy_module_attributes

  deploy_module_params = {
    deploy_module_name      = each.value.local_name
    deploy_module_namespace = each.value.local_ns
    deploy_module_image     = "nginx:1.21.6"
  }
}

data "kubernetes_nodes" "nodesX" {}