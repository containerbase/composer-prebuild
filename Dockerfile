FROM ghcr.io/containerbase/base:13.8.41@sha256:78888c1d58a555a4b98077be3a1dfaaffd01a7db813dd9b00f66e564cf4a5cbc

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
