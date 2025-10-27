FROM ghcr.io/containerbase/base:13.23.11@sha256:6ab6a08763ab0539e85e33fc4684235d98d8cd958ab5cd1b90e41ad9b76d6a44

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.14

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
