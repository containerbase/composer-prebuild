FROM ghcr.io/containerbase/base:13.25.4@sha256:ac311de198090a6dbb1724c27e17c73050aa8b4039c0894f5c395d75bd7009b1

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
