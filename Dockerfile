FROM ghcr.io/containerbase/base:14.10.12@sha256:8a2cf50fcacce46c3b8a78de1f2d8fe444e56ee8e4c9c4882895ef21370ed442

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
