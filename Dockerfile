FROM ghcr.io/containerbase/base:14.45.0@sha256:ac2098a5cd2dc119c95be5b80df50083754ef5580d916c2a6fbef26585b8f465

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
