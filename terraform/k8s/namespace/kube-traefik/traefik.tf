resource "helm_release" "traefik" {
  name       = "traefik"
  repository = "https://traefik.github.io/charts"
  chart      = "traefik"
  version    = var.helm_version

  namespace        = var.namespace
  create_namespace = false
  cleanup_on_fail  = true
  description      = "The Traefik Kubernetes Ingress provider is a Kubernetes Ingress controller; that is to say, it manages access to cluster services by supporting the Ingress specification."

  values = [
    templatefile("${path.module}/traefik.values.yaml.tmpl", {
    })
  ]
}
