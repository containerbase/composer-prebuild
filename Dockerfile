FROM ghcr.io/containerbase/base:14.25.0@sha256:1590091a3e73a1390c40351ac4442078fe591981957713f70fe45c6bbdee1c1d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
