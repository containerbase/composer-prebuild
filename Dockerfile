FROM ghcr.io/containerbase/base:14.12.6@sha256:81cbdbae23b4f50558958db04c76939e685e0ac663f6bc38068834c734c7494b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
