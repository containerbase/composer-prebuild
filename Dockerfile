FROM ghcr.io/containerbase/base:13.0.11@sha256:fd35bb6b0e087c93afceb3296c6762c8f58fc4b69700087508fd001a3fda1bcb

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
