FROM ghcr.io/containerbase/base:13.25.16@sha256:17ef41f5b3c2c6ee9aff68ad76b8edc2e094a022c8167c3364c21a1e0a14d962

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
