variable "ttl" {
  type        = number
  description = "The TTL of the DNS record"
  default     = 1
}

variable "type" {
  type        = string
  description = "The type of the DNS record (e.g., A, CNAME, MX, etc.)"
}

variable "zone_name" {
  description = "(String) DNS zone name"
  type        = string
}

variable "zone_id" {
  description = "(String) Cloudflare zone ID"
  type        = string
}

variable "comment" {
  type        = string
  description = "A comment for the DNS record"
  default     = null
}

variable "content" {
  type        = string
  description = "The content of the DNS record (e.g., IP address for A record, domain for CNAME, etc.)"
}

variable "data" {
  type        = any
  description = "Additional data for the DNS record, if applicable"
  default     = null
}

variable "priority" {
  type        = number
  description = "The priority of the DNS record, if applicable (e.g., for MX records)"
  default     = null
}

variable "proxied" {
  type        = bool
  description = "Whether the DNS record is proxied through Cloudflare"
  default     = false
}

variable "settings" {
  type        = map(any)
  description = "Additional settings for the DNS record, if applicable"
  default     = {}
}

variable "tags" {
  type        = list(string)
  description = "Tags for the DNS record"
  default     = []
}

variable "subdomain" {
  type        = string
  description = "The subdomain for the DNS record, if applicable"
  default     = ""
}