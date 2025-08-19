FROM ghcr.io/containerbase/base:13.10.6@sha256:3c92d5b9abe872724f9876eef4a4643d7c4f8751611e55fd870e98a2da164a64

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
