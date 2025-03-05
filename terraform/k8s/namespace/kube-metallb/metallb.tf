resource "helm_release" "metallb" {
  name       = "metallb"
  repository = "https://metallb.github.io/metallb"
  chart      = "metallb"
  version    = var.helm_version

  namespace        = var.namespace
  create_namespace = true
  cleanup_on_fail  = true
  description      = "MetalLB is a load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols."

  # values = [
  #   templatefile("${path.module}/metallb.values.yaml.tmpl", {
  #   })
  # ]
}

resource "kubernetes_manifest" "metallb_ipaddresspool" {
  manifest = {
    "apiVersion" = "metallb.io/v1beta1"
    "kind"       = "IPAddressPool"
    "metadata" = {
      "name"      = "default-pool"
      "namespace" = var.namespace
    }
    "spec" = {
      "addresses" = ["192.168.10.100-192.168.10.200"]
    }
  }
  depends_on = [helm_release.metallb]
}

resource "kubernetes_manifest" "metallb_l2advertisement" {
  manifest = {
    "apiVersion" = "metallb.io/v1beta1"
    "kind"       = "L2Advertisement"
    "metadata" = {
      "name"      = "l2advertisement"
      "namespace" = var.namespace
    }
  }
  depends_on = [helm_release.metallb]
}
