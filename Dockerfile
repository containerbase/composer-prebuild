FROM ghcr.io/containerbase/base:11.11.20@sha256:d31ebdb612ba9b91520438de31303d3c5c750be3990e4fdf97e46325012c3719

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
