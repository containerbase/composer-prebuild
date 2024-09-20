FROM ghcr.io/containerbase/base:11.11.19@sha256:c49769b684f76e0c940e75eb280bae9c74f1757a008908d9812ad9e0e6aded9d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
