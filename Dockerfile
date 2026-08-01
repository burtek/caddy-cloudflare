ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION}-alpine-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:${CADDY_VERSION}-alpine

LABEL org.opencontainers.image.source="https://github.com/burtek/caddy-cloudflare"
LABEL org.opencontainers.image.description="Caddy with Cloudflare DNS plugin"

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
