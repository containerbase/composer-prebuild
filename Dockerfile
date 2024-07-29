FROM ghcr.io/containerbase/base:11.2.0@sha256:62b0670c37a2b00c8bd7a9d55c956a40c95a18bc946ec5b6aed3b43f9aba4d71

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
