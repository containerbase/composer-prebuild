FROM ghcr.io/containerbase/base:13.10.17@sha256:1f397343fa27236019c56b7bddeeef3d69adfd737b2085522920a7d5b3b63652

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
