FROM ghcr.io/containerbase/base:13.23.1@sha256:95acc0e26a1ee6e339455971ebf37d58a03b664de6ba7706f5b5bf7741c5d100

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
