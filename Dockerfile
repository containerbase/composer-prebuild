FROM ghcr.io/containerbase/base:11.0.0@sha256:5560879bc953b77edb6ddf0c214ba41c23883ad82e0e685a394dbb89f3b63d95

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
