FROM ghcr.io/containerbase/base:14.8.2@sha256:58b47dbe20bd525963cc3b025a5a6ff1b1e8a9f2c56220b463ceaa1e41955ec7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
