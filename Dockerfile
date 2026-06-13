FROM ghcr.io/containerbase/base:14.11.1@sha256:c9b28cbb6184bf7154a387093b9b2a2c9a45ae2e657939e7250f7c4c39d62f2f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
