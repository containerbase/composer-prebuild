FROM ghcr.io/containerbase/base:14.12.3@sha256:36cd44a81d82db066848d769fa94ea07ebfcf2c5a56ec59707907ea3c1ab38e9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
