FROM ghcr.io/containerbase/base:13.5.10@sha256:20b2d69890a08b6587373db4cc17d513322118bdf7961b96b946dfb55bdfc06f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
