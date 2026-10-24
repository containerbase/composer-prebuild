FROM ghcr.io/containerbase/base:14.52.5@sha256:8be7848e5b8440713f60a52727e625c7f862d1ab6e5caf9818095ac348a56b54

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
