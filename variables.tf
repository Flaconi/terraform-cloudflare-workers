variable "account_id" {
  description = "The accountId on cloudflare"
  type        = string
  sensitive   = false
}

variable "kv_database_names" {
  description = "A map of KV database names"
  type        = map(string)
  default     = {}
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

variable "secrets_store_id" {
  description = "Identifier of the Cloudflare Secrets Store the secrets are written into. Required when secrets is not empty."
  type        = string
  default     = null
}

variable "secrets" {
  description = "A map of secret name to its configuration, written into the Secrets Store given by secrets_store_id. Cloudflare never returns a secret value, so terraform can create and update one but cannot detect a change made outside terraform. Scopes must be listed alphabetically."
  type = map(object({
    value   = string
    comment = optional(string)
    scopes  = optional(list(string), ["workers"])
  }))
  default = {}
}
