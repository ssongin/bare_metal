### -------------------- ### Provider args ### -------------------- ###
kubeconfig_path = "~/.kube/config-k8s"

### -------------------- ### Kubernetes common args ### -------------------- ###
ingress_class_name = "traefik"

### -------------------- ### Nfs client provisioner args ### -------------------- ###
nfs_client_repository = "https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner"
nfs-client-server     = "192.168.10.41"
nfs-client-path       = "/Seagate/k8s"

### -------------------- ### Metallb args ### -------------------- ###
metallb_repository   = "https://metallb.github.io/metallb"
metallb_namespace    = "kube-metallb"
metallb_address_pool = "192.168.10.100-192.168.10.200"

### -------------------- ### Traefik args ### -------------------- ###
traefik_repository = "https://traefik.github.io/charts"

### -------------------- ### Cert-Manager args ### -------------------- ###
cm_repository = "https://charts.jetstack.io"

### -------------------- ### Longhorn args ### -------------------- ###
longhorn_repository = "https://charts.longhorn.io"

### -------------------- ### Pihole args ### -------------------- ###
pihole_repository = "https://mojo2600.github.io/pihole-kubernetes/"
pihole_namespace  = "default" #for some reason helm is installed into default

### -------------------- ### Rancher args ### -------------------- ###
rancher_repository = "https://releases.rancher.com/server-charts/stable"

### -------------------- ### Portainer args ### -------------------- ###
portainer_repository = "https://portainer.github.io/k8s/"

### -------------------- ### Prometheus args ### -------------------- ###
prometheus_repository = "https://prometheus-community.github.io/helm-charts"
prometheus_namespace  = "monitoring"
# grafana_hostname  = "grafana.cloud.lan"
# grafana_password  = "admin"
# grafana_namespace = "monitoring"

portainer_hostname = "portainer.cloud.lan"
portainer_services = [
  {
    name = "portainer"
    port = 9000
  }
]
portainer_ingress_paths = [
  {
    path = "/"
    port = 9000
  },
  {
    path = "/secure"
    port = 9443
  },
  {
    path = "/nodeport"
    port = 30776
  }
]
portainer_ingress_annotations = {
  "kubernetes.io/ingress.class"                      = "traefik"
  "traefik.ingress.kubernetes.io/router.entrypoints" = "websecure"
  #   "traefik.ingress.kubernetes.io/router.tls"         = "true"
}

pihole_hostname        = "pihole.cloud.lan"
pihole_password        = "admin"
pihole_loadbalancer_ip = "192.168.10.101"
pihole_nameservers = [
  "127.0.0.1",
  "1.1.1.1",
  "1.0.0.1"
]
pihole_dns_a_records = 
  - "address=/cloud.lan/192.168.10.100"
  - "address=/pihole.cloud.lan/192.168.10.100"
  - "address=/rancher.cloud.lan/192.168.10.100"
  - "address=/grafana.cloud.lan/192.168.10.100"
  - "address=/traefik-dashboard.cloud.lan/192.168.10.100"
  - "address=/calibre.cloud.lan/192.168.10.100"
  - "address=/plex.cloud.lan/192.168.10."
]
pihole_services = [
  {
    name = "pihole-web"
    port = 80
  }
]

longhorn_hostname = "longhorn.cloud.lan"
longhorn_services = [
  {
    name = "longhorn-frontend"
    port = 80
  }
]
