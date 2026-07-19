FROM ghcr.io/containerbase/base:14.13.8@sha256:d8d4596e8c611aac402842fcee265b2723eb44669089e6c216497a2c2b0774b9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
