provider "helm" {
  kubernetes = {
    config_path = var.kubeconfig_path
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

provider "kubectl" {
  alias       = "kubectl_gavin"
  config_path = var.kubeconfig_path
}
