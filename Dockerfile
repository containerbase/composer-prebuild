FROM ghcr.io/containerbase/base:13.7.7@sha256:43c6259f72b0ab1ea0c03568549fe579bb8fc4c7e1d9f1d642d54119c014bb6c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
