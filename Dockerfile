FROM ghcr.io/containerbase/base:13.13.0@sha256:6ba2a71a8d21c48d5055cae7e177382890a48d6b37de47905d5172a28394fddf

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
