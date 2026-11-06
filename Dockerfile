FROM ghcr.io/containerbase/base:14.66.5@sha256:0c244e2d9bee5d3b475a85ae1eccada91b47ca2c632a96aa54501ecf86ddffcc

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
