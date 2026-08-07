FROM ghcr.io/containerbase/base:14.13.16@sha256:9543fd8aaa71df9cc386517ccd6188b65ba67b7ee249461b224142639f80145c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
