FROM ghcr.io/containerbase/base:13.8.39@sha256:efbc9e44c03167c9fa03f91d85ffee522b5cd151b9e5ef98af1fd202307925c7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
