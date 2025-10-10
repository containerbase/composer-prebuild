FROM ghcr.io/containerbase/base:13.20.2@sha256:bb8a3dc2b1b64ef81c43ae60b321091b51f36a93d88ab4cedefd8eedf998c9d5

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
