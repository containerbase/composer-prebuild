FROM ghcr.io/containerbase/base:12.0.7@sha256:f6dc1a4b29c4bef61fb33eea223a955d16be356cabce58ba86fad7709c50d817

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
