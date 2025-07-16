variable "zone_name" {
  description = "(String) DNS zone name"
  type        = string
}

variable "dns_records" {
  description = "(List) List of DNS records to create"
  type = list(object({
    subdomain = string
    type      = string
    content   = string
    ttl       = number
    proxied   = bool
    comment   = optional(string, null)
    priority  = optional(number, null)
    tags      = optional(list(string), [])
    settings  = optional(map(any), {})
  }))
  default = []
}

variable "cloudflare_token" {
  type        = string
  description = "Cloudflare API token with permissions to manage DNS records"
  default     = null
}

variable "account_id" {
  description = "(String) Cloudflare account ID"
  type        = string
}

variable "zone_type" {
  description = "(String) Type of the DNS zone, e.g. 'full' or 'partial'"
  type        = string
  default     = "full"
}

variable "zone_paused" {
  description = "(Boolean) Whether the DNS zone is paused"
  type        = bool
  default     = false
}