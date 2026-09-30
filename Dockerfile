FROM ghcr.io/containerbase/base:14.21.1@sha256:150b9ce5d54835ff80f01f6b0e451de5157ab6fda57c29cfd5c40e1ebd5f58d4

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
