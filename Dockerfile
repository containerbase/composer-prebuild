FROM ghcr.io/containerbase/base:14.62.0@sha256:721a1ff0f43c8758a1fe49802179fb3dccf3170325300e78b5b33d51e6b1d409

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
