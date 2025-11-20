FROM ghcr.io/containerbase/base:13.24.3@sha256:72b10305f0d7ac3eb4208d622d5ca9338c8184a312e28dbd7bdf91de79a21e10

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.14

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
