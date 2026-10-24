FROM ghcr.io/containerbase/base:14.52.4@sha256:778947b28ff0fccecc202b5ca6dbac0a95c3bde6bc9a4e915e6ef5f7d7fa9d0c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
