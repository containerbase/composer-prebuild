FROM ghcr.io/containerbase/base:14.6.12@sha256:8616c735746c3551986eb7282fba91038a3846392e4e4c08e983496eedc4ae50

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
