FROM ghcr.io/containerbase/base:14.51.1@sha256:0b923f22d26ba1dabcc82c967ac72d0f9d0d0e7b89b591659e75654f269c9a2a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
