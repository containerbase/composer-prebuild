FROM ghcr.io/containerbase/base:13.10.11@sha256:fdd802425ea9d307f6e6f80eadeddf764f72b5a651dbd03f94fb7cd9e31cfac5

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
