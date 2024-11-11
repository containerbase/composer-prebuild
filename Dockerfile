FROM ghcr.io/containerbase/base:13.0.13@sha256:16dca9e1eddeb9a2d3b44608f309663eac089cc895bb036c1d71be9d8d0869d7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
