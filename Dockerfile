FROM ghcr.io/containerbase/base:13.25.18@sha256:e7d65b5273c4c8298911d6d87d53151912317b1b0494d40bac88641f8ced0138

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
