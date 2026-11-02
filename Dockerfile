FROM ghcr.io/containerbase/base:14.59.8@sha256:53044fe442f5f9e675433bdade868d78db1fe1c5f09eac37987a28d78c521e1b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
