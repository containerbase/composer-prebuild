FROM ghcr.io/containerbase/base:14.4.1@sha256:ad9200aa09ce663f808d80b634e80aa4c563ec0d9955464d453f83c8b7a3311e

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
