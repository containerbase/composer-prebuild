FROM ghcr.io/containerbase/base:14.12.8@sha256:82477a5f6b5765035839365eb42d7993c85cb536b99b27f36e5b4cbc248f9264

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
