# Kubernetes args
variable "ingress_class_name" {
  description = "Default Ingress class name used in cluster"
  type        = string
  default     = "treafix"
}
variable "namespace" {
  description = "Kubernetes namespace for helm charts"
  type        = string
  default     = "monitoring"
}

#Grafana args
variable "grafana_hostname" {
  description = "Hostname for grafana ingress"
  type        = string
  default     = "grafana.cloud.lan"
}
variable "grafana_password" {
  description = "Password for grafana"
  type        = string
  default     = "admin"
}

