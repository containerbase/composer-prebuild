FROM ghcr.io/containerbase/base:11.6.1@sha256:39e66e7419e16a73c790e253dbf564eb44a9e0c7972be4bc0d16fb383f63fd4d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
