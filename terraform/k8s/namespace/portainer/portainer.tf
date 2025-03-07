resource "helm_release" "portainer" {
  name       = var.name
  repository = "https://portainer.github.io/k8s/"
  chart      = var.name

  namespace        = var.namespace
  create_namespace = true
  cleanup_on_fail  = true
  description      = "Portainer orchestration tool for kubernetes"


  values = [
    templatefile("${path.module}/${var.name}.values.yaml.tmpl", {
      ingress_class       = var.ingress_class_name
      paths               = var.portainer_ingress_paths
      hostname            = var.hostname
      ingress_annotations = var.portainer_ingress_annotations
    })
  ]
}
