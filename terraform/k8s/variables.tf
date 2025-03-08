### -------------------- ### Provider args ### -------------------- ###
variable "kubeconfig_path" {
  description = "Path to kube configuration file"
  type        = string
  default     = "~/.kube/config"
}

### -------------------- ### Kubernetes common args ### -------------------- ###
variable "ingress_class_name" {
  description = "Default Ingress class name used in cluster"
  type        = string
  default     = "treafik"
}

### -------------------- ### Metallb args ### -------------------- ###
variable "metallb_chart" {
  description = "Metallb chart name"
  type        = string
  default     = "metallb"
}
variable "metallb_version" {
  description = "Metallb chart version"
  type        = string
  default     = "0.14.9"
}
variable "metallb_name" {
  description = "Metallb application name"
  type        = string
  default     = "metallb"
}
variable "metallb_repository" {
  description = "Metallb helm repository link"
  type        = string
}
variable "metallb_namespace" {
  description = "Metallb kubernetes namespace"
  type        = string
  default     = "metallb"
}
variable "metallb_app_description" {
  description = "Metallb description"
  type        = string
  default     = "MetalLB is a load-balancer implementation for bare metal Kubernetes clusters, using standard routing protocols."
}
variable "metallb_address_pool" {
  description = "Metallb external address pool for load balancer"
  type        = string
}

### -------------------- ### Traefik args ### -------------------- ###
variable "traefik_chart" {
  description = "Traefik chart name"
  type        = string
  default     = "traefik"
}
variable "traefik_version" {
  description = "Traefik chart version"
  type        = string
  default     = "34.4.1"
}
variable "traefik_name" {
  description = "Traefik application name"
  type        = string
  default     = "traefik"
}
variable "traefik_repository" {
  description = "Traefik helm repository link"
  type        = string
}
variable "traefik_namespace" {
  description = "Traefik kubernetes namespace"
  type        = string
  default     = "kube-system"
}
variable "traefik_app_description" {
  description = "Traefik description"
  type        = string
  default     = "The Traefik Kubernetes Ingress provider is a Kubernetes Ingress controller; that is to say, it manages access to cluster services by supporting the Ingress specification."
}

### -------------------- ### Cert-Manager args ### -------------------- ###
variable "cm_chart" {
  description = "Cert-Manager chart name"
  type        = string
  default     = "cert-manager"
}
variable "cm_version" {
  description = "Cert-Manager chart version"
  type        = string
  default     = "1.17.1"
}
variable "cm_name" {
  description = "Cert-Manager application name"
  type        = string
  default     = "cert-manager"
}
variable "cm_repository" {
  description = "Cert-Manager helm repository link"
  type        = string
}
variable "cm_namespace" {
  description = "Cert-Manager kubernetes namespace"
  type        = string
  default     = "cert-manager"
}
variable "cm_app_description" {
  description = "Cert-Manager description"
  type        = string
  default     = "Cert-Manager is a Kubernetes addon to automate the management and issuance of TLS certificates from various issuing sources."
}

### -------------------- ### Longhorn args ### -------------------- ###
variable "longhorn_chart" {
  description = "Longhorn chart name"
  type        = string
  default     = "longhorn"
}
variable "longhorn_version" {
  description = "Longhorn chart version"
  type        = string
  default     = "1.8.1"
}
variable "longhorn_name" {
  description = "Longhorn application name"
  type        = string
  default     = "longhorn"
}
variable "longhorn_repository" {
  description = "Longhorn helm repository link"
  type        = string
}
variable "longhorn_namespace" {
  description = "Longhorn kubernetes namespace"
  type        = string
  default     = "longhorn-system"
}
variable "longhorn_app_description" {
  description = "Longhorn description"
  type        = string
  default     = "Longhorn is a distributed block storage system for Kubernetes."
}

### -------------------- ### Pihole args ### -------------------- ###
variable "pihole_chart" {
  description = "Pihole chart name"
  type        = string
  default     = "pihole"
}
variable "pihole_version" {
  description = "Pihole chart version"
  type        = string
  default     = "2.28.0"
}
variable "pihole_name" {
  description = "Pihole application name"
  type        = string
  default     = "pihole"
}
variable "pihole_repository" {
  description = "Pihole helm repository link"
  type        = string
}
variable "pihole_namespace" {
  description = "Pihole kubernetes namespace"
  type        = string
  default     = "dns-pihole"
}
variable "pihole_app_description" {
  description = "Pihole description"
  type        = string
  default     = "The Pi-hole is a DNS sinkhole that protects your devices from unwanted content, without installing any client-side software."
}

### -------------------- ### Portainer args ### -------------------- ###
variable "portainer_chart" {
  description = "Portainer chart name"
  type        = string
  default     = "portainer"
}
variable "portainer_version" {
  description = "Portainer chart version"
  type        = string
  default     = "1.0.61"
}
variable "portainer_name" {
  description = "Portainer application name"
  type        = string
  default     = "portainer"
}
variable "portainer_repository" {
  description = "Portainer helm repository link"
  type        = string
}
variable "portainer_namespace" {
  description = "Portainer kubernetes namespace"
  type        = string
  default     = "portainer"
}
variable "portainer_app_description" {
  description = "Portainer description"
  type        = string
  default     = "Portainer orchestration tool for kubernetes"
}



# #Grafana args
# variable "grafana_hostname" {
#   description = "Hostname for grafana ingress"
#   type        = string
#   default     = "grafana.cloud.lan"
# }
# variable "grafana_password" {
#   description = "Password for grafana"
#   type        = string
#   default     = "admin"
# }
# variable "grafana_namespace" {
#   description = "Kubernets namespace for grafana"
#   type        = string
#   default     = "monitoring"
# }

#Portainer args
variable "portainer_hostname" {
  description = "Hostname for portainer ingress"
  type        = string
}
variable "portainer_services" {
  description = "Portainer service names and ports"
  type = list(object({
    name = string
    port = number
  }))
}

variable "portainer_ingress_annotations" {
  description = "Annotations for the portainer ingress resource"
  type        = map(string)
  default = {
    "kubernetes.io/ingress.class"                      = "traefik"
    "traefik.ingress.kubernetes.io/router.entrypoints" = "web"
  }
}
variable "portainer_ingress_paths" {
  description = "Paths to access different port under same link with paths"
  type = list(object({
    path = string
    port = number
  }))
  default = [
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
}

#Pihole args
variable "pihole_hostname" {
  description = "Hostname for pihole ingress"
  type        = string
}
variable "pihole_services" {
  description = "Pihole service names and ports"
  type = list(object({
    name = string
    port = number
  }))
}
variable "pihole_password" {
  description = "Pihole password"
  type        = string
  default     = "admin"
}
variable "pihole_loadbalancer_ip" {
  description = "Load balancer IP address"
  type        = string
}
variable "pihole_dns_a_records" {
  description = "List of A record DNS entries"
  type        = list(string)
  default     = []
}
variable "pihole_nameservers" {
  description = "List of nameservers"
  type        = list(string)
  default     = ["127.0.0.1"]
}

#Longhorn args
variable "longhorn_hostname" {
  description = "Longhorn hostname"
  type        = string
}
variable "longhorn_services" {
  description = "Longhorn service names and ports"
  type = list(object({
    name = string
    port = number
  }))
}
