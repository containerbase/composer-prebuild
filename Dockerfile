FROM ghcr.io/containerbase/base:14.66.18@sha256:ef783875a4f1da2b918b88118ee3c7cbce5d987caea528a705cc1c67bbab25c9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
