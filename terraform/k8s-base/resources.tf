### -------------------- ### Kubernetes base necessities ### -------------------- ###
resource "helm_release" "nfs-external-provisioner" {
  name             = var.nfs_client_name
  namespace        = var.nfs_client_namespace
  repository       = var.nfs_client_repository
  chart            = var.nfs_client_chart
  version          = var.nfs_client_version
  create_namespace = true
  cleanup_on_fail  = true
  description      = var.nfs_client_app_description
  values           = [local.nfs_client_helm_values]
}

resource "helm_release" "metallb" {
  name             = var.metallb_name
  namespace        = var.metallb_namespace
  repository       = var.metallb_repository
  chart            = var.metallb_chart
  version          = var.metallb_version
  create_namespace = true
  cleanup_on_fail  = true
  description      = var.metallb_app_description
  values           = [local.metallb_helm_values]
  depends_on       = [helm_release.nfs-external-provisioner]
}

module "metallb-resources" {
  source       = "./modules/network/load-balancer"
  namespace    = var.metallb_namespace
  address_pool = var.metallb_address_pool
  depends_on   = [helm_release.metallb]
}

resource "helm_release" "traefik" {
  name             = var.traefik_name
  namespace        = var.traefik_namespace
  repository       = var.traefik_repository
  chart            = var.traefik_chart
  version          = var.traefik_version
  create_namespace = true
  cleanup_on_fail  = true
  description      = var.traefik_app_description
  values           = [local.traefik_helm_values]
  depends_on       = [module.metallb-resources]
}

resource "helm_release" "cert-manager" {
  name             = var.cm_name
  namespace        = var.cm_namespace
  repository       = var.cm_repository
  chart            = var.cm_chart
  version          = var.cm_version
  create_namespace = true
  cleanup_on_fail  = true
  description      = var.cm_app_description
  values           = [local.cm_helm_values]
  depends_on       = [helm_release.traefik]
}
module "cert-issuer" {
  source     = "./modules/network/cert-issuer"
  depends_on = [helm_release.cert-manager]
}
# resource "helm_release" "longhorn" {
#   name             = var.longhorn_name
#   namespace        = var.longhorn_namespace
#   repository       = var.longhorn_repository
#   chart            = var.longhorn_chart
#   version          = var.longhorn_version
#   create_namespace = true
#   cleanup_on_fail  = true
#   description      = var.longhorn_app_description
#   values           = [local.longhorn_helm_values]
#   depends_on       = [helm_release.traefik]
# }

# resource "helm_release" "rancher" {
#   name             = var.rancher_name
#   namespace        = var.rancher_namespace
#   repository       = var.rancher_repository
#   chart            = var.rancher_chart
#   version          = var.rancher_version
#   create_namespace = true
#   cleanup_on_fail  = true
#   description      = var.rancher_app_description
#   values           = [local.rancher_helm_values]
#   depends_on       = [helm_release.traefik]
# }

resource "helm_release" "dns-pihole" {
  name             = var.pihole_name
  namespace        = var.pihole_namespace
  repository       = var.pihole_repository
  chart            = var.pihole_chart
  version          = var.pihole_version
  create_namespace = true
  cleanup_on_fail  = true
  description      = var.pihole_app_description
  values           = [local.pihole_helm_values]
  depends_on       = [module.cert-issuer]
}

# resource "helm_release" "portainer" {
#   name             = var.portainer_name
#   namespace        = var.portainer_namespace
#   repository       = var.portainer_repository
#   chart            = var.portainer_chart
#   version          = var.portainer_version
#   create_namespace = true
#   cleanup_on_fail  = true
#   description      = var.portainer_app_description
#   values           = [local.portainer_helm_values]
#   depends_on       = [module.cert-issuer, helm_release.longhorn]
# }



### -------------------- ### Routes ### -------------------- ###
# module "longhorn-route" {
#   source     = "./modules/network/traefik-route"
#   namespace  = var.longhorn_namespace
#   name       = var.longhorn_name
#   hostname   = var.longhorn_hostname
#   services   = var.longhorn_services
#   depends_on = [module.cert-issuer, helm_release.longhorn]
# }

# module "portainer-route" {
#   source     = "./modules/network/traefik-route"
#   namespace  = var.portainer_namespace
#   name       = var.portainer_name
#   hostname   = var.portainer_hostname
#   services   = var.portainer_services
#   depends_on = [module.cert-issuer, helm_release.portainer]
# }

# module "rancher-route" {
#   source     = "./modules/network/traefik-route"
#   namespace  = var.rancher_namespace
#   name       = var.rancher_name
#   hostname   = var.rancher_hostname
#   services   = var.rancher_services
#   depends_on = [module.cert-issuer, helm_release.dns-pihole]
# }

module "pihole-route" {
  source     = "./modules/network/traefik-route"
  namespace  = "default" # TODO
  name       = var.pihole_name
  hostname   = var.pihole_hostname
  services   = var.pihole_services
  depends_on = [module.cert-issuer, helm_release.dns-pihole]
}
