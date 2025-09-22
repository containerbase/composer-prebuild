FROM ghcr.io/containerbase/base:13.13.13@sha256:6cc24e0aa68eba203af1fea5448c24bc6a7248109b1b64964e116bc9aee1258a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
