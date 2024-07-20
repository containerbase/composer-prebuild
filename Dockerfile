FROM ghcr.io/containerbase/base:10.15.6@sha256:bf91e96a7b49cfd19a4f8955407494b15183a842e93717599f2969513cbabf1b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
