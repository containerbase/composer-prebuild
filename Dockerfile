FROM ghcr.io/containerbase/base:12.0.9@sha256:c8278c4075bb04c39d7651b5aab9c70071f292976e1b8552def4c67116bde2d4

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
