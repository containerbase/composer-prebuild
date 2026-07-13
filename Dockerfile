FROM ghcr.io/containerbase/base:14.12.11@sha256:9b8924908d4dd8fc0bf47051d3a27db7a835751ec5f4c2bed25fa29202e0733b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
