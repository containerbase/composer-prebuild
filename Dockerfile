FROM ghcr.io/containerbase/base:14.4.4@sha256:0f4e46c22c90c27cd6f45599f73898a4eb485f6e8c8e9a2461f987fad235fd18

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
