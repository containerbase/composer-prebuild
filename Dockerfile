FROM ghcr.io/containerbase/base:14.59.3@sha256:4bfafce5c5e3c73e535dd3ba0fad14f316c7bc5d01cb8cfb27d30cdda2d353be

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
