FROM ghcr.io/containerbase/base:13.25.0@sha256:bab915d39f1e410fc5371d7f69a80ba0561a47221e261c0ca77aa9e7beb04ae2

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.14

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
