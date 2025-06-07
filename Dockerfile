FROM ghcr.io/containerbase/base:13.8.17@sha256:24a4dd4ac98c5f9cedaaae344b84157106d9538f97720a48be4e652fc04fee07

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
