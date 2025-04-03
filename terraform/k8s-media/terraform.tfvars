### -------------------- ### Provider args ### -------------------- ###
kubeconfig_path = "~/.kube/config-k8s"

### -------------------- ### Kubernetes common args ### -------------------- ###
ingress_class_name = "traefik"
timezone           = "Europe/Vilnius"

# ### -------------------- ### Calibre args ### -------------------- ###
calibre_repository = ""
calibre_hostname   = "calibre.cloud.lan"
calibre_services = [{
  name = "calibre"
  port = 8080
}]

### -------------------- ### Plex args ### -------------------- ###
plex_repository = "https://raw.githubusercontent.com/plexinc/pms-docker/gh-pages"
plex_hostname   = "plex.cloud.lan"
plex_services = [{
  name = "plex"
  port = 8080
}]
