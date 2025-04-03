### -------------------- ### Provider args ### -------------------- ###
variable "kubeconfig_path" {
  description = "Path to kube configuration file"
  type        = string
  default     = "~/.kube/config"
}

### -------------------- ### Kubernetes common args ### -------------------- ###
variable "ingress_class_name" {
  description = "Default Ingress class name used in cluster"
  type        = string
  default     = "treafik"
}
variable "timezone" {
  description = "Default timezone"
  type        = string
  default     = "Greenwich"
}

### -------------------- ### Calibre args ### -------------------- ###
variable "calibre_chart" {
  description = "Calibre chart name"
  type        = string
  default     = "calibre"
}
variable "calibre_version" {
  description = "Calibre chart version"
  type        = string
  default     = "6.0.19"
}
variable "calibre_name" {
  description = "Calibre application name"
  type        = string
  default     = "calibre"
}
variable "calibre_repository" {
  description = "Calibre helm repository link"
  type        = string
}
variable "calibre_namespace" {
  description = "Calibre kubernetes namespace"
  type        = string
  default     = "media-library"
}
variable "calibre_app_description" {
  description = "Calibre description"
  type        = string
  default     = "Calibre is a complete software stack for teams adopting containers. It addresses the operational and security challenges of managing multiple Kubernetes clusters, while providing DevOps teams with integrated tools for running containerized workloads."
}
variable "calibre_username" {
  description = "Username for the calibre gui"
  type        = string
  default     = "admin"
}
variable "calibre_password" {
  description = "Password's md5 hash for the calibre gui"
  type        = string
  default     = "21232f297a57a5a743894a0e4a801fc3" #admin
}
variable "calibre_hostname" {
  description = "Hostname for calibre ingress"
  type        = string
}
variable "calibre_services" {
  description = "Calibre service names and ports"
  type = list(object({
    name = string
    port = number
  }))
}

### -------------------- ### Plex args ### -------------------- ###
variable "plex_chart" {
  description = "Plex chart name"
  type        = string
  default     = "plex-media-server"
}
variable "plex_version" {
  description = "Plex chart version"
  type        = string
  default     = "0.9.1"
}
variable "plex_name" {
  description = "Plex application name"
  type        = string
  default     = "plex-media-server"
}
variable "plex_repository" {
  description = "Plex helm repository link"
  type        = string
}
variable "plex_namespace" {
  description = "Plex kubernetes namespace"
  type        = string
  default     = "media-library"
}
variable "plex_app_description" {
  description = "Plex description"
  type        = string
  default     = "Plex is a complete software stack for teams adopting containers. It addresses the operational and security challenges of managing multiple Kubernetes clusters, while providing DevOps teams with integrated tools for running containerized workloads."
}
variable "plex_username" {
  description = "Username for the plex gui"
  type        = string
  default     = "admin"
}
variable "plex_password" {
  description = "Password's md5 hash for the plex gui"
  type        = string
  default     = "21232f297a57a5a743894a0e4a801fc3" #admin
}
variable "plex_hostname" {
  description = "Hostname for plex ingress"
  type        = string
}
variable "plex_services" {
  description = "Plex service names and ports"
  type = list(object({
    name = string
    port = number
  }))
}
