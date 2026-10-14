FROM ghcr.io/containerbase/base:14.33.0@sha256:24fd8b38eb9e12e868886937eb778434eb49e220ab5638078509a0711646f8ee

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
