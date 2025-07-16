FROM ghcr.io/containerbase/base:13.8.61@sha256:1a2ea1bf6557bf9d988d2830e9b85c1e74b38f330e15731e4920da7c0854debd

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
