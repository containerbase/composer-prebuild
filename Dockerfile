FROM ghcr.io/containerbase/base:14.58.0@sha256:e799bbbd537afdc2fdcc789ac112b3c307cd9a1ffbb2489053336ca5c252be09

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
