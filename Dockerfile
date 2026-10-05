FROM ghcr.io/containerbase/base:14.26.0@sha256:d846944451a4ea14417c5bea3a23bec634d7cb5a0161c8f4b9fe3c7c73459a01

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
