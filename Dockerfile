FROM ghcr.io/containerbase/base:14.4.3@sha256:bee14c66d96fe25506fc319ae2c3c9a0fe3fc20c4c711182ab9c20bb5c306e3d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
