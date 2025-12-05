locals {
  routes_enabled       = length(var.enabled_routes) > 0 || length(var.disabled_routes) > 0
  routes_config_valid  = var.zone_id != null && var.domain_name != null && var.worker_name != null
  should_create_routes = local.routes_enabled && local.routes_config_valid
}

resource "cloudflare_workers_kv_namespace" "this" {
  for_each   = var.kv_database_names
  account_id = var.account_id
  title      = each.value
}

resource "cloudflare_workers_route" "enabled" {
  for_each = local.should_create_routes && length(var.enabled_routes) > 0 ? var.enabled_routes : []
  zone_id  = var.zone_id
  pattern  = format("%s%s", var.domain_name, each.value)
  script   = var.worker_name
}

resource "cloudflare_workers_route" "disabled" {
  for_each = local.should_create_routes && length(var.disabled_routes) > 0 ? var.disabled_routes : []
  zone_id  = var.zone_id
  pattern  = format("%s%s", var.domain_name, each.value)
  script   = null
}
