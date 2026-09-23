FROM ghcr.io/containerbase/base:14.17.1@sha256:42c534d20ff87db146473a78f17f618dc24a40fabfed8daa5701557c6e3d00a9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
