FROM ghcr.io/containerbase/base:14.31.2@sha256:ae2543f4119662430f7a5cce8c4e4dd7bf6512b5753fc2658ec60c9f29397888

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
