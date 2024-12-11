FROM ghcr.io/containerbase/base:13.2.3@sha256:3fdf6d6ab9b14779164b30b7291ee65d846cf7e8635ca28b229ba927e965402b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
