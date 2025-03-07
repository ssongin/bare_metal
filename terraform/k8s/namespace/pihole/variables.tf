# Kubernetes args
variable "namespace" {
  description = "Kubernetes namespace for helm charts"
  type        = string
  default     = "dns-pihole"
}

#Pi hole args
variable "pihole_hostname" {
  description = "Hostname for portainer ingress"
  type        = string
  default     = "pihole.cloud.lan"
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

