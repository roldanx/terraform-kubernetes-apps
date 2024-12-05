provider "kubernetes" {
  config_path = "~/.kube/config"
  #  config_context = "kind-kind"
}

resource "random_pet" "instance" {
  length = 2
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_pod" "pod" {
  metadata {
    name      = random_pet.instance.id
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
        value = "test"
      }

      port {
        container_port = 80
      }

      liveness_probe {
        http_get {
          path = "/"
          port = 80

          http_header {
            name  = "X-Custom-Header"
            value = "Awesome"
          }
        }

        initial_delay_seconds = 3
        period_seconds        = 3
      }
    }

    dns_config {
      nameservers = ["1.1.1.1", "8.8.8.8", "9.9.9.9"]
      searches    = ["example.com"]

      option {
        name  = "ndots"
        value = 1
      }

      option {
        name = "use-vc"
      }
    }

    dns_policy = "None"
  }
}

module "deployment_module" {
  source = "./module"
  
  deploy_module = [
  {
    deploy_module_name      = "nginx-module-1"
    deploy_module_namespace = kubernetes_namespace.namespace.metadata[0].name
    deploy_module_image     = kubernetes_pod.pod.spec[0].container[0].image
  },
  {
    deploy_module_name      = "nginx2-module-2"
    deploy_module_namespace = kubernetes_namespace.namespace.metadata[0].name
    deploy_module_image     = null
  }
  ]
}