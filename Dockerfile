FROM ghcr.io/containerbase/base:11.11.17@sha256:2d4acc13b697a6345b6cd53e263f10c3ad6ebd1c7d63fcf13513d93590857aaa

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
