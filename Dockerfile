FROM ghcr.io/containerbase/base:13.21.0@sha256:b0c48e6d3690a48fc33fed6129fd0b9c7899793b035d47de57e6a479379cf655

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
