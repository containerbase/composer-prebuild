FROM ghcr.io/containerbase/base:13.0.22@sha256:9cb70d95d15d4c5f436e6c66e159f2c554b81b4ec8bf0c43343622fc7e9720e7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
