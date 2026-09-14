FROM ghcr.io/containerbase/base:14.14.9@sha256:4c2d6abe9273450ed8f04f65411486315e8fb19db0da6a5745f5825e36b030e8

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
