FROM ghcr.io/containerbase/base:13.25.15@sha256:610479efdd106ae83620e546204ac51818db8951d4561ecf49f07390e3f2532e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
