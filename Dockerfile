FROM ghcr.io/containerbase/base:13.14.0@sha256:58400bb44d0b3c543a391832418369df26d12a9f624359faf095a77b351a71c9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
