FROM ghcr.io/containerbase/base:14.51.2@sha256:c346e2840bb9b8e15445297016bc1b21e5b17350bef689a7a252f3208fd13362

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
