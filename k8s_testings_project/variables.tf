variable "namespace" {
  description = "Namespace"
  type        = string
}

variable "pod_image" {
  description = "Pod&Deployment image"
  type        = string
  default     = "latest"
}

variable "pod_amount" {
  description = "Amount of Pods"
  type        = number
  default     = 1
    validation {
    condition     = var.pod_amount <= 1
    error_message = "Hey you, resources are not FREE! Max 1 Pod allowed"
    }
}