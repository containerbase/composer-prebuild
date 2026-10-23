FROM ghcr.io/containerbase/base:14.52.3@sha256:0bfd1147de69e38a00afafad15f85c5c862e3d4333df1397123c2e74ae9825ec

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
