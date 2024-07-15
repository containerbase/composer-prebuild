FROM ghcr.io/containerbase/base:10.15.5@sha256:c8d2b91d587cd209a4efec035ba81c0e25168a6417a7766da703ad63abe7ef7a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
