# Kubernetes args
variable "namespace" {
  description = "Kubernetes namespace for helm charts"
  type        = string
  default     = "longhorn-system"
}
variable "name" {
  description = "Name"
  type        = string
  default     = "longhorn"
}

variable "helm_version" {
  description = "Version of MetalLB to install"
  type        = string
  default     = "1.8.1"
}

#Longhorn args
variable "hostname" {
  description = "Hostname for longhorn ingress"
  type        = string
  default     = "longhorn.cloud.lan"
}
