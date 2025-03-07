resource "helm_release" "longhorn" {
  name       = var.name
  repository = "https://charts.longhorn.io"
  chart      = var.name
  version    = var.helm_version

  namespace        = var.namespace
  create_namespace = true
  cleanup_on_fail  = true
  description      = "Longhorn is a distributed block storage system for Kubernetes."

  values = [
    templatefile("${path.module}/${var.name}.values.yaml.tmpl", {
    })
  ]
}
