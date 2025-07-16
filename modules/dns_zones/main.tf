terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.6.0"
    }
  }
}

resource "cloudflare_zone" "zone" {
  account = {
    id = var.account_id
  }
  name   = var.zone_name
  type   = var.zone_type
  paused = var.zone_paused
}

