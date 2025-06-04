# Output generated from child module outputs
output "child_module_outputs" {
  description = "Child module outputs"
  value       = module.apps
}

# Output generated from child module outputs
output "pod_name" {
  description = "Name of the Pod"
  value       = "The name of the Pod is ${module.apps.pod_name[0]}"
}

# Output generated from child module outputs
output "pod_name_length" {
  description = "Name of the Pod"
  value       = "The length of the name is ${length(module.apps.pod_name)}"
}

output "input_variable" {
  description = "Print input variable"
  value       = var.input_variable
  sensitive   = true
}

output "node-ids" {
  value = [for node in data.kubernetes_nodes.nodes.nodes : node.spec.0.provider_id]
}
