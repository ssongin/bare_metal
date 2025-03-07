resource "helm_release" "grafana" {
  name              = "grafana"
  repository        = "https://grafana.github.io/helm-charts"
  chart             = "grafana"

  namespace         = var.namespace
  create_namespace  = true 
  cleanup_on_fail   = true 
  description       = "Grafana observability platform for home lab cluster" 
  
  values = [
    templatefile("${path.module}/grafana.values.yaml.tmpl", {
      ingress_class = var.ingress_class_name
      password = var.grafana_password
      hostname = var.grafana_hostname
    })
  ]
}