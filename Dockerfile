FROM ghcr.io/containerbase/base:14.10.11@sha256:a1f4b7a99af7923343d388b4a179def047449f27c6eb93c240586863094570b7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
