FROM ghcr.io/containerbase/base:11.11.10@sha256:275a5a4af8f25305c86881e756b9f69e994bf4d5ec5548731573f654cceef1fe

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
