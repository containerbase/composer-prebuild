FROM ghcr.io/containerbase/base:14.8.0@sha256:0242cedae39637f1cedf9a11ad713a35af16f2937cc44d647997353f7d9572a0

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
