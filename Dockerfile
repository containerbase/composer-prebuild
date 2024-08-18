FROM ghcr.io/containerbase/base:11.11.5@sha256:8bf3cd0de89656c19ce0bb9ce5202a57256f3a72bfa54001faf07e2f92f4e000

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
