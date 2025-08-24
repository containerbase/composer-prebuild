FROM ghcr.io/containerbase/base:13.10.9@sha256:f14ec1b5d7e1c557069a3fd2d5302d173d914d66da35d70a13fedd5e3a68f821

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
