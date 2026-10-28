FROM ghcr.io/containerbase/base:14.56.0@sha256:77cfffb2493ea9a8a3488fe434209c725f4c3f239e4e4e2098f2a9840cd52f89

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
