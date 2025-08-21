FROM ghcr.io/containerbase/base:13.10.8@sha256:1a46c3947e796fbd1d93e93b15fe6d653d43cc60587182f333a69a0e76ae1fcc

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
