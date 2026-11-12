FROM ghcr.io/containerbase/base:14.66.22@sha256:b12c9ed0fa275414886d65baaec56c892a917120d5d133e89719052419276d05

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
