FROM ghcr.io/containerbase/base:14.39.0@sha256:5da5c8171b5a074c0b4fb286481b74a3ca6631fa2dbca179c59d86947f2c5627

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
