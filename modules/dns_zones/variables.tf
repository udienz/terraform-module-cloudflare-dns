variable "account_id" {
  description = "(String) Cloudflare account ID"
  type        = string
}

variable "zone_name" {
  description = "(String) DNS zone name"
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