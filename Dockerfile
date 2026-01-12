FROM ghcr.io/containerbase/base:13.26.0@sha256:29d66ab9759858677d8a830d4baa683b67557e23645a10d2a55768ea6ffb14f3

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
