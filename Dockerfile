FROM ghcr.io/containerbase/base:11.11.15@sha256:5b000c9e31ee4d55ceac1caaf5acd39617441fa35075fdd82bdd40b8c32a7ac7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
