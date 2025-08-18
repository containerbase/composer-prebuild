FROM ghcr.io/containerbase/base:13.10.3@sha256:82cc486a06f7734833359962355d6a318e2776cc09ca62312d7e12be3cbd686b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
