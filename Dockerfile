FROM ghcr.io/containerbase/base:14.52.1@sha256:099e3a3733ff5abdda9c98ed31164356e605bd4b8c724b6a5668598073c0173d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
