FROM ghcr.io/containerbase/base:13.2.1@sha256:35277aa27b7e9f4a370e066c5e97a1d4c59c2d55a610cf763045d18b3aeccb33

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
