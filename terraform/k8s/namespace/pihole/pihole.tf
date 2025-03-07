resource "helm_release" "dns-pihole" {
  name              = "pihole"
  repository        = "https://mojo2600.github.io/pihole-kubernetes/"
  chart             = "pihole"

  namespace         = var.namespace
  create_namespace  = true 
  cleanup_on_fail   = true 
  description       = "The Pi-hole is a DNS sinkhole that protects your devices from unwanted content, without installing any client-side software." 

  values = [
    templatefile("${path.module}/pihole.values.yaml.tmpl", {
      hostname = var.pihole_hostname
      dns_entries = var.pihole_dns_a_records
      password = var.pihole_password
      loadbalancerIP = var.pihole_loadbalancer_ip
      nameservers = var.pihole_nameservers
    })
  ]
}