FROM ghcr.io/containerbase/base:13.15.0@sha256:0237959aa14e8320d731583c9d6239f85543c18ca093396d89c37d06c53051a1

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
