FROM ghcr.io/containerbase/base:10.13.1@sha256:bad6ed0cc3323117372e7b337339a8a4d4b2a962da463ec1a7baf24ffadc54f4

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
