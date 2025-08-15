FROM ghcr.io/containerbase/base:13.10.1@sha256:1439aadfae39ace7285585483d82517713e4057a00d470a618a3596b4c49ed73

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
