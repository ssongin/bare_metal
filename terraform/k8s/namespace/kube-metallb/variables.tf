# Kubernetes args
variable "namespace" {
  description = "Kubernetes namespace for helm charts"
  type        = string
  default     = "kube-metallb"
}

variable "helm_version" {
  description = "Version of MetalLB to install"
  type        = string
  default     = "0.14.9"
}
