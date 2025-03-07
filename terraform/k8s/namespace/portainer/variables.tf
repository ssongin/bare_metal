# Kubernetes args
variable "ingress_class_name" {
  description = "Default Ingress class name used in cluster"
  type        = string
  default     = "treafik"
}
variable "namespace" {
  description = "Kubernetes namespace for helm charts"
  type        = string
  default     = "portainer"
}
variable "name" {
  description = "Name"
  type        = string
  default     = "portainer"
}

#Portainer args
variable "hostname" {
  description = "Hostname for portainer ingress"
  type        = string
  default     = "portainer.cloud.lan"
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
