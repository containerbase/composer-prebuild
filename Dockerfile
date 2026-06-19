FROM ghcr.io/containerbase/base:14.12.1@sha256:ab0a2742e98da3ea80a8f65a34a1de4dca774d74496f2276c5ec3775189ac320

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
