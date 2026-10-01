FROM ghcr.io/containerbase/base:14.23.0@sha256:81eda1a933a4a0819ea2f2b960499c989e876729b4b871e81b5db5ac9b11e5bb

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
