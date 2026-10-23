FROM ghcr.io/containerbase/base:14.52.0@sha256:ea18b24a88bf0e155bba8fe5cf2766f044356c306fe9112312de54459943b3dd

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
