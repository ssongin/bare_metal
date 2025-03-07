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
    kubectl = kubectl.kubectl_gavin
  }
}

module "longhorn-system" {
  source     = "./namespace/longhorn-system"
  depends_on = [module.cert-manager]
}

module "portainer" {
  source                        = "./namespace/portainer"
  ingress_class_name            = var.ingress_class_name
  namespace                     = var.portainer_namespace
  hostname                      = var.portainer_hostname
  portainer_ingress_annotations = var.portainer_ingress_annotations
  portainer_ingress_paths       = var.portainer_ingress_paths
  depends_on                    = [module.longhorn-system]
}

module "pihole" {
  source                 = "./namespace/pihole"
  namespace              = "default" # TODO for some reason it forces pihole into default namespace
  hostname               = var.pihole_hostname
  pihole_password        = var.pihole_password
  pihole_loadbalancer_ip = var.pihole_loadbalancer_ip
  pihole_dns_a_records   = var.pihole_dns_a_records
  pihole_nameservers     = var.pihole_nameservers
  depends_on             = [module.longhorn-system]
}


### ---------- Routes ---------- ###

module "longhorn-route" {
  source     = "./modules/network/traefik-route"
  namespace  = var.longhorn_namespace
  name       = var.longhorn_name
  hostname   = var.longhorn_hostname
  services   = var.longhorn_services
  depends_on = [module.cert-manager, module.longhorn-system]
}

module "portainer-route" {
  source     = "./modules/network/traefik-route"
  namespace  = var.portainer_namespace
  name       = var.portainer_name
  hostname   = var.portainer_hostname
  services   = var.portainer_services
  depends_on = [module.cert-manager, module.portainer]
}

module "pihole-route" {
  source     = "./modules/network/traefik-route"
  namespace  = "default" # TODO
  name       = var.pihole_name
  hostname   = var.pihole_hostname
  services   = var.pihole_services
  depends_on = [module.cert-manager, module.pihole]
}
