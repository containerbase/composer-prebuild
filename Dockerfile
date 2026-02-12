FROM ghcr.io/containerbase/base:14.1.0@sha256:d66d8ebc1cb5ad0ca126436a6e670c6eff7fb25a5db2fef78683c349e515390e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
