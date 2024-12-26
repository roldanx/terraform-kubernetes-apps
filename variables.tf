variable "namespace" {
  description = "Namespace"
  type        = string
}

variable "pod_image" {
  description = "Pod&Deployment image"
  type        = string
  default     = "latest"
}