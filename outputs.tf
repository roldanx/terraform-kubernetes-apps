output "pod_id" {
  description = "ID of the Pod"
  value       = kubernetes_pod.pod.id
}

output "pod_ns" {
  description = "NS of the Pod"
  value       = kubernetes_pod.pod.metadata[0].namespace
}

output "pod_name" {
  description = "Name of the Pod"
  value       = kubernetes_pod.pod.metadata[0].name
}

output "pod_image" {
  description = "Image of the Pod"
  value       = kubernetes_pod.pod.spec[0].container[0].image
}
