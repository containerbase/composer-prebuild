FROM ghcr.io/containerbase/base:14.13.9@sha256:0cc5d32866fb7a64a014fc79ae907ae252444a08e87c28122a6d11296ac14128

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
