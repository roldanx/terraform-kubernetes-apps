variable "namespace" {
  description = "Namespace"
  type        = string
  default     = "terraform"
}

variable "pod_image" {
  description = "Pod&Deployment image"
  type        = string
  default     = "nginx:1.21.6"
}