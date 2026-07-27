FROM ghcr.io/containerbase/base:14.13.11@sha256:2f3ff1e9cb500d36ccdeb4aae780b33b206b4c5713328c2e48c069e674daf4b7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
