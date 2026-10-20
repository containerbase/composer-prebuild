FROM ghcr.io/containerbase/base:14.44.3@sha256:7d287f1b251352728bed1df465cdcf4b89f629acb76fcff03739bd968788ac6d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
