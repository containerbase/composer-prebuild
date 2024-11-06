FROM ghcr.io/containerbase/base:13.0.7@sha256:a5dff667bb43c80408b4ca70800642511a491c219485e3207fc04811763f542e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
