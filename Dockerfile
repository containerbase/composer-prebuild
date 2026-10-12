FROM ghcr.io/containerbase/base:14.32.1@sha256:c2e8e1ed4eb1279458678ee3f59798219680a3f202a4fd0f2f4f567c17982ca7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
