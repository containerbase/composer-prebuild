FROM ghcr.io/containerbase/base:13.18.0@sha256:2e5be16694c33e809a99fbce699a2560683589e890d0ff0a9a0b533d204af510

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
