resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.11.0"
  namespace  = "cert-manager"

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "kubernetes_manifest" "cluster_issuer" {
  manifest = yamlencode({
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-prod"
    }
    spec = {
      acme = {
        email = "calebache001@gmail.com"
        server = "https://acme-v02.api.letsencrypt.org/directory"
        privateKeySecretRef = {
          name = "letsencrypt-cluster-issuer-key"
        }
        solvers = [
          {
            http01 = {
              ingress = {
                class = "nginx"
              }
            }
          }
        ]
      }
    }
  })

  depends_on = [
    helm_release.cert_manager,
  ]
}