provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "ingress-nginx" {
  name       = var.base_name
  repository = var.repository
  chart      = var.chart

  namespace = var.namespace

  values = [
    {
      "controller": {
        "replicaCount": 3,
        "service": {
          "annotations": {
            "service.beta.kubernetes.io/azure-load-balancer-health-probe-request-path": "/healthz"
          }
        }
      }
    }
  ]
}
