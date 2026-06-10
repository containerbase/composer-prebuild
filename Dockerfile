FROM ghcr.io/containerbase/base:14.10.25@sha256:1e0c0f168566861b19eafcac956b46d24ccf608cbb128d16b53b8d53657b5819

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
