FROM ghcr.io/containerbase/base:13.8.62@sha256:d23cceb013806fbcd4c22b5f876c42be1045f1f3e0c035eade6546cd7f17c8fc

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
