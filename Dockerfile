FROM ghcr.io/containerbase/base:14.41.1@sha256:9bf0c432aad042fec7112905e8e443b4e1ad3ee640a85abd718fd0893d3a060d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
