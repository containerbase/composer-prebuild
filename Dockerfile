FROM ghcr.io/containerbase/base:14.27.0@sha256:dd2eeeb4d100636d21e815fcf95d9fd2a16e35373ff5bb607da289ad71302526

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
