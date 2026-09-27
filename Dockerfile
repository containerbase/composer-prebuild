FROM ghcr.io/containerbase/base:14.18.4@sha256:85d43953eb99700669dab0b3057b6359f105e1a34840ea5af369d1007f46e275

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
