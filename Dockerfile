FROM ghcr.io/containerbase/base:14.20.2@sha256:6c9e427202975b565ea50f450b66c74ddbef0d2952b7b8dfa6b9b0dacf622215

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
