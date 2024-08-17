FROM ghcr.io/containerbase/base:11.11.2@sha256:d1870d8fbc01b0d949b1aedd32684110e082213de14f92cad228f1d13053734e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
