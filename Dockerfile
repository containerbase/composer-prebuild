FROM ghcr.io/containerbase/base:14.66.10@sha256:495eef9b32c6c3c9141e4ef12779d12bd388489d2e20cabc467b867dc2c783b0

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
