FROM ghcr.io/containerbase/base:13.7.9@sha256:581c542f5678879acfd3ee72e5161b0dffd6ac3ba0a6b4d64978351897253df4

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
