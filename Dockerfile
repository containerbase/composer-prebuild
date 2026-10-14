FROM ghcr.io/containerbase/base:14.40.0@sha256:4db7a533e4f362803ab6f3b16beb52f4559bc74416a4120fbbfa60ac8480b979

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
