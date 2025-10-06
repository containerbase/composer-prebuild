FROM ghcr.io/containerbase/base:13.17.0@sha256:ad28a6c7ddc30f3695453bbab1ac4983b1b881956da08a35a2dd5e4a23f2a4a3

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
