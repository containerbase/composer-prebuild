FROM ghcr.io/containerbase/base:14.13.6@sha256:ef0eba60f92f3b5aa017d9a41e500f11502a2bfa75d2d743a0a9133529d022e6

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
