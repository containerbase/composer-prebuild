FROM ghcr.io/containerbase/base:14.18.1@sha256:263b8061944826b060f7112794d4a8f7457d589934714fb97da269c710212783

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
