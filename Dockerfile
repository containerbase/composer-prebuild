FROM ghcr.io/containerbase/base:14.10.24@sha256:fcf2e943ff1a3371e29c1e7ad3b8b982da7c65f7b7e628e4b182b58549beefbe

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
