locals {
  use_multi_zone = length(var.zones) > 0

  zones_normalized = local.use_multi_zone ? var.zones : {
    default = {
      zone_id         = var.zone_id
      domain_name     = var.domain_name
      disabled_routes = var.disabled_routes
    }
  }

  routes_enabled = length(var.enabled_routes) > 0 || anytrue([
    for zone in local.zones_normalized : length(zone.disabled_routes) > 0
  ])

  routes_config_valid = local.use_multi_zone ? (
    alltrue([
      for zone in var.zones : zone.zone_id != null && zone.domain_name != null
    ]) && var.worker_name != null
    ) : (
    var.zone_id != null && var.domain_name != null && var.worker_name != null
  )

  should_create_routes = local.routes_enabled && local.routes_config_valid
}

resource "cloudflare_workers_kv_namespace" "this" {
  for_each   = var.kv_database_names
  account_id = var.account_id
  title      = each.value
}

resource "cloudflare_workers_route" "enabled" {
  for_each = merge([
    for zone_key, zone in local.zones_normalized :
    local.should_create_routes && length(var.enabled_routes) > 0 && zone.zone_id != null && zone.domain_name != null ? {
      for route in var.enabled_routes :
      "${zone_key}-${route}" => {
        zone_id     = zone.zone_id
        domain_name = zone.domain_name
        route       = route
      }
    } : {}
  ]...)

  zone_id = each.value.zone_id
  pattern = format("%s%s", each.value.domain_name, each.value.route)
  script  = var.worker_name
}

resource "cloudflare_workers_route" "disabled" {
  for_each = merge([
    for zone_key, zone in local.zones_normalized :
    local.should_create_routes && length(zone.disabled_routes) > 0 && zone.zone_id != null && zone.domain_name != null ? {
      for route in zone.disabled_routes :
      "${zone_key}-${route}" => {
        zone_id     = zone.zone_id
        domain_name = zone.domain_name
        route       = route
      }
    } : {}
  ]...)

  zone_id = each.value.zone_id
  pattern = format("%s%s", each.value.domain_name, each.value.route)
  script  = null
}
