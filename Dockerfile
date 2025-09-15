FROM ghcr.io/containerbase/base:13.13.2@sha256:33ff6f9b3d219c85fc74b05c312fbc1b9d828840b5ea9c9202b13594d3b96ec8

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
