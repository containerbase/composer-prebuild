FROM ghcr.io/containerbase/base:13.8.59@sha256:12a5ba995def0a5bf62eed579335897b8757b52f75e8d77d4c3c46e358770124

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
