FROM ghcr.io/containerbase/base:14.21.0@sha256:7cd631b480d71a93adeb126890ef0823672b724df2662ba8e784284c548db177

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
