resource "cloudflare_workers_kv_namespace" "this" {
  for_each   = var.kv_database_names
  account_id = var.account_id
  title      = each.value
}

resource "cloudflare_workers_route" "enabled" {
  for_each = toset(var.enabled_routes)
  zone_id  = var.zone_id
  pattern  = format("%s%s", var.domain_name, each.value)
  script   = var.worker_name
}

resource "cloudflare_workers_route" "disabled" {
  for_each = toset(var.disabled_routes)
  zone_id  = var.zone_id
  pattern  = format("%s%s", var.domain_name, each.value)
  script   = null
}
