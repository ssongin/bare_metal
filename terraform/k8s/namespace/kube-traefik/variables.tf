# Kubernetes args
variable "namespace" {
  description = "Kubernetes namespace for helm charts"
  type        = string
  default     = "kube-system"
}

variable "helm_version" {
  description = "Version of Traefik to install"
  type        = string
  default     = "34.4.1"
}
