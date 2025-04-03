variable "namespace" {
  description = "Kubernetes namespace for route and certificate charts"
  type        = string
}
variable "name" {
  description = "Application name"
  type        = string
}
variable "hostname" {
  description = "Hostname for application"
  type        = string
}
variable "services" {
  description = "Service list with names and ports"
  type = list(object({
    name = string
    port = number
  }))
}
