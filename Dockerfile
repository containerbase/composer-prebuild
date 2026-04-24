FROM ghcr.io/containerbase/base:14.9.1@sha256:e5a8b39317e4afc6af1f375d598d3766969c9cf2987abb800b90a5169c7e2938

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
