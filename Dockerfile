FROM ghcr.io/containerbase/base:10.12.1@sha256:a40f3d9e8d46afb1e4dd200329b5a663b2e796f772748f67d1f53d4fa18e5ff8

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
