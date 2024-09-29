FROM ghcr.io/containerbase/base:11.11.26@sha256:61fbccbf584bf2f10f5640598fb710c500a2b0d4e723ec2591252d5a279d3f85

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
