resource "helm_release" "longhorn" {
  name       = "longhorn"
  repository = "https://charts.longhorn.io"
  chart      = "longhorn"
  version    = var.helm_version

  namespace        = var.namespace
  create_namespace = true
  cleanup_on_fail  = true
  description      = "MetalLB is a load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols."

  values = [
    templatefile("${path.module}/longhorn.values.yaml.tmpl", {
    })
  ]
}
