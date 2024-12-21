FROM ghcr.io/containerbase/base:13.5.0@sha256:0e0097dfbea18139095978abd79aa842a3abbce0ba8b7d0cf14651b9094979ec

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
