FROM ghcr.io/containerbase/base:11.11.13@sha256:53c228aff88c9a821e44a1e52d7490daf90eded89a94772000c245e84301075c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
