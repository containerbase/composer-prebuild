FROM ghcr.io/containerbase/base:14.35.0@sha256:aa4760c4d8f0407d740452e0637550596ad2254c29ef4b3da8f5f8867e22d947

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
