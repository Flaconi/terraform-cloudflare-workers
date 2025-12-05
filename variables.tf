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
  type        = string
  default     = null
}

variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = null
}

variable "disabled_routes" {
  description = "A list of disabled routes for worker"
  type        = set(string)
  default     = []
}

variable "enabled_routes" {
  description = "A list of routes enabled for worker"
  type        = set(string)
  default     = []
}


variable "worker_name" {
  description = "worker name"
  type        = string
  default     = null
}

variable "zones" {
  description = "Map of zone configurations. Each zone can have zone_id, domain_name, and optional disabled_routes. When provided, this takes precedence over single zone_id/domain_name variables."
  type = map(object({
    zone_id         = string
    domain_name     = string
    disabled_routes = optional(set(string), [])
  }))
  default = {}
}
