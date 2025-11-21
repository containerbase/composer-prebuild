FROM ghcr.io/containerbase/base:13.25.1@sha256:d91b2ea004ca58164a9c36aef4ad92256a6e6cf5899d7e58a9fcbd46bd36f7c6

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
