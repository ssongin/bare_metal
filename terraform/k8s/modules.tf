module "kube-metallb" {
  source = "./namespace/kube-metallb"
}

module "kube-traefik" {
  source     = "./namespace/kube-traefik"
  depends_on = [module.kube-metallb]
}

module "cert-manager" {
  source     = "./namespace/cert-manager"
  depends_on = [module.kube-traefik]

  providers = {
    kubectl    = kubectl.kubectl_gavin
    helm       = helm
    kubernetes = kubernetes
  }
}

module "longhorn-system" {
  source     = "./namespace/longhorn-system"
  depends_on = [module.cert-manager]

  providers = {
    kubectl    = kubectl.kubectl_gavin
    helm       = helm
    kubernetes = kubernetes
  }
}

# module "monitoring" {
#   source = "./namespace/monitoring"
#   ingress_class_name = var.ingress_class_name
#   namespace = var.grafana_namespace
#   grafana_hostname = var.grafana_hostname
#   grafana_password = var.grafana_password
# }

module "portainer" {
  source                        = "./namespace/portainer"
  ingress_class_name            = var.ingress_class_name
  namespace                     = var.portainer_namespace
  hostname                      = var.portainer_hostname
  portainer_ingress_annotations = var.portainer_ingress_annotations
  portainer_ingress_paths       = var.portainer_ingress_paths
}

module "pihole" {
  source                 = "./namespace/pihole"
  namespace              = var.pihole_namespace
  pihole_hostname        = var.pihole_hostname
  pihole_password        = var.pihole_password
  pihole_loadbalancer_ip = var.pihole_loadbalancer_ip
  pihole_dns_a_records   = var.pihole_dns_a_records
  pihole_nameservers     = var.pihole_nameservers
}

