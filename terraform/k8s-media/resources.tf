# ### -------------------- ### Kubernetes media applications ### -------------------- ###
# resource "helm_release" "calibre" {
#   name             = var.calibre_name
#   namespace        = var.calibre_namespace
#   repository       = var.calibre_repository
#   chart            = var.calibre_chart
#   version          = var.calibre_version
#   create_namespace = true
#   cleanup_on_fail  = true
#   description      = var.calibre_app_description
#   values           = [local.calibre_helm_values]
# }

resource "helm_release" "plex" {
  name             = var.plex_name
  namespace        = var.plex_namespace
  repository       = var.plex_repository
  chart            = var.plex_chart
  version          = var.plex_version
  create_namespace = true
  cleanup_on_fail  = true
  description      = var.plex_app_description
  values           = [local.plex_helm_values]
}
# ### -------------------- ### Routes ### -------------------- ###
# module "calibre-route" {
#   source     = "./modules/network/traefik-route"
#   namespace  = var.calibre_namespace
#   name       = var.calibre_name
#   hostname   = var.calibre_hostname
#   services   = var.calibre_services
#   depends_on = [helm_release.calibre]
# }

module "plex-route" {
  source     = "./modules/network/traefik-route"
  namespace  = var.plex_namespace
  name       = var.plex_name
  hostname   = var.plex_hostname
  services   = var.plex_services
  depends_on = [helm_release.plex]
}
