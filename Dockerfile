FROM ghcr.io/containerbase/base:13.8.64@sha256:f5764aa4daac3f1003c6ad579dad894efb85db3fea79a748d7eae57bf0201f78

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
