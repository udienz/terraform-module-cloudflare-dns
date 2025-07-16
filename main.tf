terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.6.0"
    }
  }
}

variable "api_token" {
  type        = string
  description = "Cloudflare API token with permissions to manage DNS records"
  default     = null
  nullable    = true
}

data "cloudflare_zone" "default" {
  filter = {
    name = var.zone_name
  }
}

module "dns_zones" {
  source      = "./modules/dns_zones"
  zone_name   = var.zone_name
  account_id  = var.account_id
  zone_type   = var.zone_type
  zone_paused = var.zone_paused
}

locals {
  records = { for index, record in var.dns_records :
    try(record.key, format("%s-%s-%s", record.subdomain, record.type, record.content)) => record
  }
}

module "dns_records" {
  source    = "./modules/dns_records"
  zone_id   = data.cloudflare_zone.default.zone_id
  for_each  = local.records
  subdomain = each.value.subdomain
  type      = each.value.type
  content   = each.value.content
  ttl       = each.value.ttl
  proxied   = each.value.proxied
  comment   = each.value.comment
  priority  = each.value.priority
  tags      = each.value.tags
  settings  = each.value.settings
  zone_name = var.zone_name
  # dns_records = var.dns_records
}
