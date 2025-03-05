# Kubernetes args
variable "namespace" {
  description = "Kubernetes namespace for helm charts"
  type        = string
  default     = "longhorn-system"
}

variable "helm_version" {
  description = "Version of MetalLB to install"
  type        = string
  default     = "1.8.1"
}
