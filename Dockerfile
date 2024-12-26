FROM ghcr.io/containerbase/base:13.5.3@sha256:715965d5ca7f6bdbe8e6797d73c376e7a8edd6db07dd7565b7055c68df2e82db

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
