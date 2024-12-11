FROM ghcr.io/containerbase/base:13.2.4@sha256:0ab5b37afe63a2a65ea47a2fd9cc7f0d95ae775d79459913538311acaf60f6e6

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
