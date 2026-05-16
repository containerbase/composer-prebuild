FROM ghcr.io/containerbase/base:14.10.13@sha256:9021e72da96ad1e11fe23759dcd7ffe8e53c01010854fa93b61cdb44ee44b6bb

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
