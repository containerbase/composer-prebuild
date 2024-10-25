FROM ghcr.io/containerbase/base:13.0.1@sha256:da22a07e329aaaaae8c63db88ea10194f58eabb084f85898763aaecf22d3b575

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
