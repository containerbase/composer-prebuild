FROM ghcr.io/containerbase/base:13.5.11@sha256:6b8932b3744c01425f4007a62e2e34f40d00e7804c9d44bba50d88fd50ea31a3

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
