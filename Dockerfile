FROM ghcr.io/containerbase/base:13.8.8@sha256:34251c4bc8b6bbaeb8853a63823e67093b6e4071bb533154b7e1d00f7d483d85

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
