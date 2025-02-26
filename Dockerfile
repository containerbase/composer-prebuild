FROM ghcr.io/containerbase/base:13.8.3@sha256:81461c7705c65631c5a5b93b0953ca899aa452297856952756baa2b25509047c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
