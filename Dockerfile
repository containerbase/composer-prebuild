FROM ghcr.io/containerbase/base:14.59.6@sha256:761ec450969e6726b13ddd1b35cd2bec3d4e9b629dddd38a31c5096553a39694

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
