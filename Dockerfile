FROM ghcr.io/containerbase/base:13.8.66@sha256:70fc43c8b3e96c665a5a824afc7fabbf429aaaeee9fc442f0b852faa4f2f4bce

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
