FROM ghcr.io/containerbase/base:14.12.2@sha256:7c501a9a0597b64a244755aa3009325f5992863ce5885acdefe7d2985d59e5f9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
