FROM ghcr.io/containerbase/base:13.14.5@sha256:692c8a12e149481f214b5591e4a21af1433f853aa7e0f25559abca6d1d852d8d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
