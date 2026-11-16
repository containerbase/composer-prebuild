FROM ghcr.io/containerbase/base:14.66.27@sha256:5e8fee2869581cd2d227002246f04109ac70aab3562235cc4d2b4eab4f3f48c8

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
