FROM ghcr.io/containerbase/base:14.10.1@sha256:507b9d455ea84fc6a4c4c94297be298117a80b9bf8cf6c0d42f2874f61869f78

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
