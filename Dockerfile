FROM ghcr.io/containerbase/base:13.23.0@sha256:cb4ed10e6f554ea0d83a0cd5b7b933e1dd012ba8ee744263e8191e44de71974f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
