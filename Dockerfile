FROM ghcr.io/containerbase/base:13.26.1@sha256:71936bd211d95d4754a247d4fdb29405a7fc9a930b8772a829a3fa82a26c8bbb

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
