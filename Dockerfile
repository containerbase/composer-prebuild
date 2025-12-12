FROM ghcr.io/containerbase/base:13.25.14@sha256:06b5c96f4c57ff6588591624d1af3f942373d6de03a83dc7fb83cce16627a15b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
