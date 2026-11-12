FROM ghcr.io/containerbase/base:14.66.19@sha256:d158862ea11c78bcd235760cb54c2d23ceea9d580a06b771b87b93dd84b004de

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
