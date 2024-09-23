FROM ghcr.io/containerbase/base:11.11.23@sha256:6eaea919624c4987718ac5bc01f38f3fca1192453327ed52b0e85b5bfb724580

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
