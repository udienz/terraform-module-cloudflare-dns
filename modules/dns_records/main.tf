terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.6.0"
    }
  }
}

resource "cloudflare_dns_record" "record" {
  zone_id = var.zone_id
  name = (
    var.subdomain != "" ?
    "${var.subdomain}.${var.zone_name}" :
    var.zone_name
  )
  ttl      = var.ttl
  type     = var.type
  content  = var.content
  proxied  = var.proxied
  comment  = var.comment
  priority = var.priority
  tags     = var.tags
  settings = var.settings
}
