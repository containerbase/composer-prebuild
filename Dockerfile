FROM ghcr.io/containerbase/base:14.13.5@sha256:44a0045408d85900ebd5a915bd78fcf59f832373cb791479568f808fccb182f2

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
