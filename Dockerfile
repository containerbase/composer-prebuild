FROM ghcr.io/containerbase/base:14.13.17@sha256:12359075d2b4db7d0c1b62982345de6a4e9ad652fbd6a220ffa0cc346b79ead8

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
