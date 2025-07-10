output "pod_ns" {
  description = "NS of the Pod"
  value       = kubernetes_pod.pod[0].metadata[0].namespace
  sensitive = true
}

output "pod_name" {
  description = "Name of the Pod"
  value       = kubernetes_pod.pod[*].metadata[0].name
}

output "node-ids" {
  value = [for node in data.kubernetes_nodes.nodesX.nodes : node.spec.0.provider_id]
}