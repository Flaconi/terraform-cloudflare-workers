terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.20.0"
    }
  }
  required_version = "~> 1.8"
}
