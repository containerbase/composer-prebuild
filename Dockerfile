FROM ghcr.io/containerbase/base:14.1.2@sha256:65dce0baea0cf2a6b96920677b39a49b1298c0319b6c44ce4d6e4694b838e80f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
