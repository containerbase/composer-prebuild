FROM ghcr.io/containerbase/base:14.13.19@sha256:61bb7837974628d06a52ba1a9fcb5b09e2e6f64f5744946084ab60a9a7b24d2e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
