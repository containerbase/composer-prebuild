FROM ghcr.io/containerbase/base:14.10.5@sha256:a44ba04e30d3e74c0d9dd75b9a28f55045012324f6b30933d8c5fedab7680285

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
