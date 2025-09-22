FROM ghcr.io/containerbase/base:13.14.1@sha256:5918b4a1f93dbff9ed507ccdbec9a1570c7eaeed5187f8b545adab4ff1f3c040

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
