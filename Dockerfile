FROM ghcr.io/containerbase/base:13.18.1@sha256:6e73cb6e90a0ada6b5dcf2ad193eb3a83f60b07ee0c7775ed7e02977f02582a2

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
