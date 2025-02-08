provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "hello_world" {
  metadata {
    name = "hello-world-nodejs"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "hello-world-nodejs"
      }
    }
    template {
      metadata {
        labels = {
          app = "hello-world-nodejs"
        }
      }
      spec {
        container {
          name  = "hello-world-nodejs"
          image = "navsho/hello-world-nodejs:latest"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "hello_world" {
  metadata {
    name = "hello-world-nodejs"
  }
  spec {
    selector = {
      app = "hello-world-nodejs"
    }
    port {
      port        = 80
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}
