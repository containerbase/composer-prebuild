FROM ghcr.io/containerbase/base:13.25.12@sha256:99bce8e2f74678d1cd96a2e39a3abf7349f6821965f2d7565361665363454df4

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
