FROM ghcr.io/containerbase/base:14.12.9@sha256:8a4f204c7aaa0b1a3eda4387e456c64e12513119638879d8353972c4fe77bc4e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
