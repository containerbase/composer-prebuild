FROM ghcr.io/containerbase/base:13.8.47@sha256:5830fbf173c08e78540756af7f6977c5f0ff4893fcb12b12b5034f8972acd609

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
