FROM ghcr.io/containerbase/base:14.61.0@sha256:f7aab6a33cf36affdbeed71ae3c4248c48af562b2fa8c12474748899bf5cd93d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
