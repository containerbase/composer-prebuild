FROM ghcr.io/containerbase/base:14.41.0@sha256:0684699bd1e4ea974818e06f448e6bc987a43b4ddc6849402a028515c11961fb

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
