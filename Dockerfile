FROM ghcr.io/containerbase/base:13.10.16@sha256:1ec4ae991cd94f1ec1f9e7f2f19f397d61cbb88b4ad4270b1d3f3de230fedc5f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
