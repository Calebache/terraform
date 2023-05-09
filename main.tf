terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.31.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

module "rg" {
  source    = "./modules/resource_grp"
  base_name = "cloudessence"
  location  = "West Europe"
}

module "aks" {
  source              = "./modules/aks"
  base_name           = "cloudessence"
  resource_group_name = module.rg.resource_group_name_out
  location            = module.rg.location_out
  node_pools = [{
    name           = "agentpool"
    max_count      = 3
    os_diskSize_gb = 128
  }]
  tags = {
    "cloudessence:application-name" = "cloudessence"
    "cloudessence:owner"            = "cloudessence"
    "cloudessence:environment"      = "staging"
  }

  depends_on = [
    module.rg
  ]

}

module "nginx" {
  source = "./modules/nginx-ingress"
  base_name = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress -nginx"
  namespace = "ingress-nginx"

  depends_on = [
    module.rg
  ]
}

module "cert-manager" {
  source = "./modules/cert-manager"
  base_name = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart = "cert-manager"
  version    = "v1.11.0"
  namespace  = "cert-manager"
}