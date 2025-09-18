resource "cloudflare_workers_kv_namespace" "this" {
  for_each   = var.kv_database_names
  account_id = var.account_id
  title      = each.value
}
