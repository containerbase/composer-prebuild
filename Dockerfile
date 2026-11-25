FROM ghcr.io/containerbase/base:14.69.3@sha256:d998a3bc2f8ccee4394c40ecde8e599a8fa240b782365ca088a23143fe3335c3

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.6.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
