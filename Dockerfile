FROM ghcr.io/containerbase/base:14.10.16@sha256:ba01c5085693d7cd31b473b56d3190ecbe8d626ef901c9ed515ee4b749f4a01f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
