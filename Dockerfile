FROM ghcr.io/containerbase/base:14.10.23@sha256:49d4865e1c8cbae4121f9d4a090518a2c0338d0b27f44ca49afa889f59143c56

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
