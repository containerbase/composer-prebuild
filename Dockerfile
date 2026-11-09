FROM ghcr.io/containerbase/base:14.66.13@sha256:9b35077026ff242869c08dfb536eda5efba70859692e052082ae5ec1dfdf4c6c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
