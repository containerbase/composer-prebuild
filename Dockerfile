FROM ghcr.io/containerbase/base:10.15.2@sha256:0d11770eb8dadf082bfcec1a0e151f4993fb088808d42c83913e1080997a327f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
