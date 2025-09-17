FROM ghcr.io/containerbase/base:13.13.6@sha256:5ea3695fe9eeef0666ff84cd239e8b2e7f8171ed3c84921bb327d03c9d33c79f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
