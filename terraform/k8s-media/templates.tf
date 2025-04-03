locals {
  calibre_helm_values = templatefile("${path.module}/helm-values/calibre.yaml.tftpl", {
    timezone = var.timezone
    username = var.calibre_username
    password = var.calibre_password
  })
  plex_helm_values = templatefile("${path.module}/helm-values/plex.yaml.tftpl", {
    timezone = var.timezone
    username = var.calibre_username
    password = var.calibre_password
  })
}
