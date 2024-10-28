FROM ghcr.io/containerbase/base:13.0.3@sha256:3ffe63dfd008190001138e1f046566e0394a1c6daeb810cfef3895be0873a89b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
