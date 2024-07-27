FROM ghcr.io/containerbase/base:11.1.2@sha256:2a81ece6b085eed6f5faaf8be4a6d696c977ee82d22258cc6629751ea821687e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
