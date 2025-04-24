FROM ghcr.io/containerbase/base:13.8.16@sha256:c44873e0a805336cc0c4f6cc475a0576584de79715d5ee14b39e2ff2548bef45

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
