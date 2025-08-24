FROM ghcr.io/containerbase/base:13.10.10@sha256:4389fcabea8aaa14b0d0a6c77d96c4bd63bff2c8014b1d3d8eb29c7194a36824

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
