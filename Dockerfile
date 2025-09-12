FROM ghcr.io/containerbase/base:13.12.2@sha256:a5cd10956bb0b0febb4383863e96cce9727832a24c87349ce65e3dedfaa4063e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
