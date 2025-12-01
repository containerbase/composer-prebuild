FROM ghcr.io/containerbase/base:13.25.5@sha256:bb5278925c9693ef3048dc04eb126b5c59a45fcf30da0e53b63cafb77f46f49e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
