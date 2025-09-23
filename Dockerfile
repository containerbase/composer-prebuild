FROM ghcr.io/containerbase/base:13.14.2@sha256:128526614629028ce06a3383e96a9a4ed78f32008886ade364e5d552cd23eb02

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
