locals {
  metallb_helm_values  = ""
  traefik_helm_values  = templatefile("${path.module}/helm-values/traefik.yaml.tftpl", {})
  cm_helm_values       = templatefile("${path.module}/helm-values/cert-manager.yaml.tftpl", {})
  longhorn_helm_values = templatefile("${path.module}/helm-values/longhorn.yaml.tftpl", {})
  pihole_helm_values = templatefile("${path.module}/helm-values/pihole.yaml.tftpl", {
    hostname       = var.pihole_hostname
    dns_entries    = var.pihole_dns_a_records
    password       = var.pihole_password
    loadbalancerIP = var.pihole_loadbalancer_ip
    nameservers    = var.pihole_nameservers

  })
  portainer_helm_values = templatefile("${path.module}/helm-values/portainer.yaml.tftpl", {
    ingress_class       = var.ingress_class_name
    paths               = var.portainer_ingress_paths
    hostname            = var.portainer_hostname
    ingress_annotations = var.portainer_ingress_annotations
  })
  prometheus_helm_values = templatefile("${path.module}/helm-values/prometheus.yaml.tftl", {

  })
}
