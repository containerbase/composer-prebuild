FROM ghcr.io/containerbase/base:13.20.0@sha256:5c7ebd7c44bcb43fea8e3856cec06683449d4f5eb6fc007ac33a6d13086da078

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
