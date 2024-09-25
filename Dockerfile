FROM ghcr.io/containerbase/base:11.11.25@sha256:5217b071d517ade0b0a8f9d38f2477baf34ecd0c15c2d96443cda414908ae039

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
