FROM ghcr.io/containerbase/base:14.13.4@sha256:01b2378b20d16e0125720e7202664f1c8f968c08050903cab1388c23b1ec7bd3

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
