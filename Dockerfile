FROM ghcr.io/containerbase/base:14.6.1@sha256:29c72630896fb484911a5cb72b0ea48b4155d91e4ff97c6cd47eb0e5dd3fe4a1

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
