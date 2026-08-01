# Caddy + Cloudflare

Custom Docker image based on the official Caddy Alpine image with the Cloudflare DNS provider plugin (`github.com/caddy-dns/cloudflare`) built in.

This image enables the `acme_dns cloudflare` directive, allowing Caddy to obtain and renew TLS certificates via the Cloudflare DNS challenge.

## Image

```text
ghcr.io/burtek/caddy-cloudflare
```

## Included plugin

* `dns.providers.cloudflare`

## Building

Images are built and published through the GitHub Actions workflow.

The workflow is triggered manually and accepts a Caddy version in one of the following formats:

| Input    | Based release used           | Published tags                            |
| -------- | -----------------------------|------------------------------------------ |
| `2`      | Latest 2.x patch release     | `<patch>`, `<minor>` and `2`              |
| `2.11`   | Latest 2.11.x patch release  | `<patch>`, `2.11` and `2`                 |
| `2.11.4` | Exactly 2.11.4 version       | `2.11.4`, `2.11` and `2`                  |

## Example

```caddyfile
{
    email admin@example.com
    acme_dns cloudflare {env.CLOUDFLARE_API_TOKEN}
}
```

For Cloudflare API token requirements, refer to the official Caddy Cloudflare DNS provider documentation.
