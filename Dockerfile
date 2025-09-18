FROM ghcr.io/containerbase/base:13.13.7@sha256:de3ffa48fc017b3c2c34d60b93f952dc1f19d7ebee2aa5615801d77393d66500

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
