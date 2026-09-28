FROM ghcr.io/containerbase/base:14.19.0@sha256:5c2c27977528d01ecb9b790202e2474f58764cdc814fab8ec076741262eb8a89

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
