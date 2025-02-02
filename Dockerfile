FROM ghcr.io/containerbase/base:13.7.4@sha256:60d8d218122f7071eaa7d926fc75d9ba0550cb0101c204fad3a6f591f94a5aa9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
