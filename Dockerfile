FROM ghcr.io/containerbase/base:13.0.27@sha256:e8feebba3e0017b0b92c93af091138480427f512929731a96875c6b024d275ec

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
