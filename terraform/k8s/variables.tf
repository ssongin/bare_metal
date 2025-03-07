# Provider args
variable "kubeconfig_path" {
  description = "Path to kube configuration file"
  type        = string
  default     = "~/.kube/config"
}

# Kubernetes args
variable "ingress_class_name" {
  description = "Default Ingress class name used in cluster"
  type        = string
  default     = "treafik"
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
variable "portainer_namespace" {
  description = "Kubernets namespace for portainer"
  type        = string
  default     = "portainer"
}
variable "portainer_name" {
  description = "Longhorn application name"
  type        = string
  default     = "portainer"
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
variable "pihole_namespace" {
  description = "Kubernetes namespace for Pihole"
  type        = string
  default     = "dns-pihole"
}
variable "pihole_name" {
  description = "Pihole application name"
  type        = string
  default     = "pihole"
}
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

#Cert manager args
variable "cert_manager_namespace" {
  description = "Kubernetes namespace for Cert-manager"
  type        = string
  default     = "cert-manager"
}

#Longhorn args
variable "longhorn_namespace" {
  description = "Longhorn namespace. Can't be changed!"
  type        = string
  default     = "longhorn-system"
}
variable "longhorn_name" {
  description = "Longhorn application name"
  type        = string
  default     = "longhorn"
}
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
