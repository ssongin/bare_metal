variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
}
variable "address_pool" {
  description = "Metallb load balancer address pool"
  type        = string
}
