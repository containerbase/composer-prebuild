FROM ghcr.io/containerbase/base:14.59.7@sha256:b2ff06032e91a9b79dd5761b3a4f1d68aba38c8d6a935a38e7422ffe72435037

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
