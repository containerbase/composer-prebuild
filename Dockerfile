FROM ghcr.io/containerbase/base:14.5.1@sha256:136421887c0c1b2667270da7c71a1bb4d18d76cab849de27a760a95369825324

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
