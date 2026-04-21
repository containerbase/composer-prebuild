FROM ghcr.io/containerbase/base:14.7.2@sha256:dee83a089008fd01ca62ca70701e5887e42faecaea89340571c620b3bc1c862c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
