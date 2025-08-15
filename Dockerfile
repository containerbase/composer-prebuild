FROM ghcr.io/containerbase/base:13.9.0@sha256:9666d79615bf7a6ef26a37c2a26b8065edb33a524c78d75955c93b907b8237c7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
