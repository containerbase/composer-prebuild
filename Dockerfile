FROM ghcr.io/containerbase/base:14.70.0@sha256:e760a3f8b3ab14137f916fe5aa4cfdaf0516d265697cde47e81faf2f723f3ae4

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.6.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
