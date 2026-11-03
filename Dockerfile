FROM ghcr.io/containerbase/base:14.63.0@sha256:1a43239ade55c61da53bedadcafdc1642470fb34d17620f48fe0920ddad38807

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
