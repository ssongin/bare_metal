resource "helm_release" "application" {
  name       = var.name
  repository = var.repository
  chart      = var.chart

  namespace        = var.namespace
  create_namespace = true
  cleanup_on_fail  = true
  description      = var.description
  values = [
    templatefile("${path.module}/${var.name}.values.yaml.tmpl", {
      hostname       = var.hostname
      dns_entries    = var.pihole_dns_a_records
      password       = var.pihole_password
      loadbalancerIP = var.pihole_loadbalancer_ip
      nameservers    = var.pihole_nameservers
    })
  ]
}
