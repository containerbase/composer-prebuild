FROM ghcr.io/containerbase/base:14.12.7@sha256:47217dec5edb8b7a67883e05736d90790dded113c4311ebed8207857b39641d9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
