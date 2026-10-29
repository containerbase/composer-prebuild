FROM ghcr.io/containerbase/base:14.57.1@sha256:7c9aaa7b86a027d1d2de8a8670f911bb19787241b01e288abe1095c9e3c01078

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
