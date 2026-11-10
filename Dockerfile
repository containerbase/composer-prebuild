FROM ghcr.io/containerbase/base:14.66.14@sha256:979631e1e5cd5bcdb8c0a11dc7ff8f668e85b8a7bb5d41f90088fce47ac92ebd

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
