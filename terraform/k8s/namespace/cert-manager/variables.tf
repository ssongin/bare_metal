# Kubernetes args
variable "namespace" {
  description = "Kubernetes namespace for helm charts"
  type        = string
  default     = "cert-manager"
}

variable "helm_version" {
  description = "Version of cert-manager to install"
  type        = string
  default     = "1.17.1"
}

