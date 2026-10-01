FROM ghcr.io/containerbase/base:14.24.0@sha256:6c58ba9f5a53edbc9f12f9ea05d075922120ef51c4579dccbda5c5d64ce6fd83

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
