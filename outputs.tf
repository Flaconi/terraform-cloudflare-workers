output "kv_namespaces" {
  description = "Map of kv_database_names key to the id of the created KV namespace, so other stacks can bind or publish the id without copying it by hand."
  value       = { for key, ns in cloudflare_workers_kv_namespace.this : key => ns.id }
}