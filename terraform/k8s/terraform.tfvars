kubeconfig_path = "~/.kube/config-k8s"

ingress_class_name = "traefik"

# grafana_hostname  = "grafana.cloud.lan"
# grafana_password  = "admin"
# grafana_namespace = "monitoring"

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
  "traefik.ingress.kubernetes.io/router.entrypoints" = "web"
  #   "traefik.ingress.kubernetes.io/router.entrypoints" = "websecure"
  #   "traefik.ingress.kubernetes.io/router.tls"         = "true"
}

pihole_hostname        = "pihole.cloud.lan"
pihole_password        = "admin"
pihole_namespace       = "dns-pihole"
pihole_loadbalancer_ip = "192.168.10.101"
pihole_nameservers = [
  "127.0.0.1",
  "1.1.1.1",
  "1.0.0.1"
]
pihole_dns_a_records = ["address=/cloud.lan/192.168.10.100",
  "address=/pihole.cloud.lan/192.168.10.100",
  "address=/portainer.cloud.lan/192.168.10.100",
  "address=/grafana.cloud.lan/192.168.10.100",
  "address=/longhorn.cloud.lan/192.168.10.100",
  "adderss=/traefix-dashboard.cloud.lan/192.168.10.100"
]

cert_manager_namespace = "cert-manager"

