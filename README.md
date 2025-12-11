# Cloudflare Workers

This Terraform module allows you to set up environment variables and key-value (KV) stores for Cloudflare Workers.

[![lint](https://github.com/flaconi/terraform-cloudflare-workers/workflows/lint/badge.svg)](https://github.com/flaconi/terraform-cloudflare-workers/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/terraform-cloudflare-workers/workflows/test/badge.svg)](https://github.com/flaconi/terraform-cloudflare-workers/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-cloudflare-workers.svg)](https://github.com/flaconi/terraform-cloudflare-workers/releases)
[![Terraform](https://img.shields.io/badge/Terraform--registry-cloudflare--workers-brightgreen.svg)](https://registry.terraform.io/modules/flaconi/workers/cloudflare/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 5.12.0 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5.12.0 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_account_id"></a> [account\_id](#input\_account\_id)

Description: The accountId on cloudflare

Type: `string`

### <a name="input_kv_database_names"></a> [kv\_database\_names](#input\_kv\_database\_names)

Description: A map of KV database names

Type: `map(string)`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id)

Description: Zone ID on cloudflare for the domain

Type: `string`

Default: `null`

### <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name)

Description: Domain name

Type: `string`

Default: `null`

### <a name="input_disabled_routes"></a> [disabled\_routes](#input\_disabled\_routes)

Description: A list of disabled routes for worker

Type: `set(string)`

Default: `[]`

### <a name="input_enabled_routes"></a> [enabled\_routes](#input\_enabled\_routes)

Description: A list of routes enabled for worker

Type: `set(string)`

Default: `[]`

### <a name="input_worker_name"></a> [worker\_name](#input\_worker\_name)

Description: worker name

Type: `string`

Default: `null`

### <a name="input_zones"></a> [zones](#input\_zones)

Description: Map of zone configurations. Each zone can have zone\_id, domain\_name, and optional disabled\_routes. When provided, this takes precedence over single zone\_id/domain\_name variables.

Type:

```hcl
map(object({
    zone_id         = string
    domain_name     = string
    disabled_routes = optional(set(string), [])
  }))
```

Default: `{}`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

No outputs.

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2025 **[Flaconi GmbH](https://github.com/flaconi)**
