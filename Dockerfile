FROM ghcr.io/containerbase/base:14.1.1@sha256:000021c8596320989f12ba80e4841f3f8a0705901308f9f6ac873bff8566662e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
