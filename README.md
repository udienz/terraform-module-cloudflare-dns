# terraform-module-cloudflare-dns

A reusable Terraform module to manage Cloudflare DNS zones and DNS records.

## Features

- Create and manage Cloudflare DNS zones.
- Create, update, and manage multiple DNS records.
- Supports advanced DNS record settings, tags, priorities, and proxied status.
- Utilizes the official Cloudflare Terraform provider.

## Requirements

- Terraform >= 1.0
- Cloudflare Terraform provider >= 5.6.0
- A Cloudflare API token with permissions to manage DNS records.

## Usage

```hcl
provider "cloudflare" {
  api_token = var.cloudflare_token
}

module "cloudflare_dns" {
  source      = "udienz/terraform-module-cloudflare-dns"
  account_id  = "<your_cloudflare_account_id>"
  zone_name   = "<your_zone_name>"
  dns_records = [
    {
      subdomain = "www"
      type      = "A"
      content   = "192.0.2.1"
      ttl       = 120
      proxied   = false
      comment   = "Example A record"
    },
    {
      subdomain = ""
      type      = "MX"
      content   = "mail.example.com"
      ttl       = 300
      proxied   = false
      priority  = 10
    }
  ]
}
```

## Input Variables

| Name               | Type                                                                                                          | Description                                                    | Default      |
|--------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|--------------|
| `zone_name`        | `string`                                                                                                     | DNS zone name (e.g. example.com)                               | n/a          |
| `dns_records`      | `list(object)`<br>(see below)                                                                                | List of DNS records to create                                  | `[]`         |
| `cloudflare_token` | `string`                                                                                                     | Cloudflare API token with permissions to manage DNS records     | `null`       |
| `account_id`       | `string`                                                                                                     | Cloudflare account ID                                          | n/a          |
| `zone_type`        | `string`                                                                                                     | Type of the DNS zone, e.g. `full` or `partial`                 | `"full"`     |
| `zone_paused`      | `bool`                                                                                                       | Whether the DNS zone is paused                                 | `false`      |

### `dns_records` object fields

- `subdomain` (string): The subdomain for the DNS record, if applicable.
- `type` (string): The type of the DNS record (e.g., A, CNAME, MX, etc.).
- `content` (string): The content of the DNS record.
- `ttl` (number): The TTL (Time to Live) of the DNS record.
- `proxied` (bool): Whether the DNS record is proxied through Cloudflare.
- `comment` (string, optional): A comment for the DNS record.
- `priority` (number, optional): The priority of the DNS record (for MX records).
- `tags` (list(string), optional): Tags for the DNS record.
- `settings` (map(any), optional): Additional settings for the DNS record.
