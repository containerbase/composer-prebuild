FROM ghcr.io/containerbase/base:14.43.0@sha256:4646fdf373f044ddb51d85c7b31839f62a0491495b7da75b7eed39da425ad917

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
