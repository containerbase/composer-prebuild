FROM ghcr.io/containerbase/base:14.68.2@sha256:a78da54a185fa9ee862c92fca2cfe502aa94f615af0f40c34d50ba4ad818dec7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.6.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
