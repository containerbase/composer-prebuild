FROM ghcr.io/containerbase/base:13.1.0@sha256:f077fbe432f0ba51cff5f18d0f387500cf4d4e6c253084fe906e8fc6885ce9b9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
