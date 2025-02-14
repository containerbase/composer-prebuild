FROM ghcr.io/containerbase/base:13.7.14@sha256:cb641361951a5b74ad4ae653d389f6a37cc04010f44886fee4e527779ec7f892

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
