FROM ghcr.io/containerbase/base:13.8.50@sha256:b9da075fc6cc37bbbcf02e775806ff00c9e28773ea2c3673fd869e460871017e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
