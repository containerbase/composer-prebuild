FROM ghcr.io/containerbase/base:10.13.0@sha256:ec24fffe654f2f90a499aa1491db83698d040b18a169c113009485d6356c8e0b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
