FROM ghcr.io/containerbase/base:13.10.14@sha256:428d383d26277041b2dba63e73ead1d4eef5395ba89885ba92fafa24ee92c3d0

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
