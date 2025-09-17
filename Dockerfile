FROM ghcr.io/containerbase/base:13.13.5@sha256:3bcd3379f0a72ffe21582f73342ab31d5adb4135427b00602294128b0957286a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
