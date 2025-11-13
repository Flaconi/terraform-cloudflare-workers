variable "account_id" {
  description = "The accountId on cloudflare"
  type        = string
  sensitive   = false
}

variable "kv_database_names" {
  description = "A map of KV database names"
  type        = map(string)
}

variable "zone_id" {
  description = "Zone ID on cloudflare for the domain"
  type        = String
}

variable "enabled_routes" {
  description = "A map of routes enabled for worker"
  type        = map(String)
}

variable "disabled_routes" {
  description = "A map of disabled routes for worker"
  type        = map(String)
}

variable "worker_name" {
  description = "worker name"
  type        = String
}
