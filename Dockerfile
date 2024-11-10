FROM ghcr.io/containerbase/base:13.0.12@sha256:13ed2c3aff01073f365a8a71a9caa4a1a28e0e133773804687cbd073383453b0

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
