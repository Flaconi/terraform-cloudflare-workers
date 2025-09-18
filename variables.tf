variable "account_id" {
  description = "The accountId on cloudflare"
  type        = string
  sensitive   = false
}

variable "kv_database_names" {
  description = "A map of KV database names"
  type        = map(string)
}
