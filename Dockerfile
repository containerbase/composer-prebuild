FROM ghcr.io/containerbase/base:13.8.44@sha256:2fc5ad34e5fe692ac6dd681deab03533faaf0c1deb8d3a24244261fb57346a5a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
