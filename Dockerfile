FROM ghcr.io/containerbase/base:14.63.1@sha256:8255d9fdc1588d3dedcc8f449c8c755283116db92f948d962c83f7c71b126ccc

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
