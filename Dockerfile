FROM ghcr.io/containerbase/base:14.6.10@sha256:2894656e603a20d3ad70e3f167b47b1b6b5b6b8df6c63aec6023790a6a5a779b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
