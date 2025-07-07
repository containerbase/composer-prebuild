FROM ghcr.io/containerbase/base:13.8.53@sha256:ca91307a174c10bb3e82f9fe269993e3c8174b0aee77077f3cd4e4c38565d009

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
