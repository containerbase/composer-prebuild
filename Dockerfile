FROM ghcr.io/containerbase/base:14.36.0@sha256:9c407668c26782f81d77d8e5ec30a8159f0c78d13c8cef1b271b2d5f982526cf

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
