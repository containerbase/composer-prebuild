FROM ghcr.io/containerbase/base:14.6.4@sha256:3f29ae0ba7eee08ee4ed5e21f8445c3e48193fc1e55714cadbea0ca3d03f9131

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
