FROM ghcr.io/containerbase/base:11.9.0@sha256:3137d18444cb7d3ef0427046d6802a53d2b75c9327fa70a6461646935026e802

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
