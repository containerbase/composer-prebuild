FROM ghcr.io/containerbase/base:14.2.0@sha256:b8e896263e35c2ccd126b5d22db192cbcdd72e7dbb1252bfad6652a8ba7e9d1e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
