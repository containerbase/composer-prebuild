FROM ghcr.io/containerbase/base:14.30.2@sha256:3e2e08a3fdc75031d6566656ea5605030ca5e5c5dbafc776bc2c33f3a1d3c4e9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
