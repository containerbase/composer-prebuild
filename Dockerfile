FROM ghcr.io/containerbase/base:13.8.42@sha256:6d25603bdcd5a179b78a5c9f22a812e5587a21ac365437b06aa87eccfc05c1da

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
