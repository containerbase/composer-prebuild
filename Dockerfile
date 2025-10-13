FROM ghcr.io/containerbase/base:13.20.5@sha256:daa607e61a89f2da4a81be195568cda0e8c673a750d6e24e42feec754cd96870

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
