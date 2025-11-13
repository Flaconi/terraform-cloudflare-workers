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
  description = "A list of routes enabled for worker"
  type        = list(String)
}

variable "disabled_routes" {
  description = "A list of disabled routes for worker"
  type        = list(String)
}

variable "worker_name" {
  description = "worker name"
  type        = String
}
