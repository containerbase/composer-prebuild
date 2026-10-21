FROM ghcr.io/containerbase/base:14.46.0@sha256:6694ee845a72c21d20055d7b1f87836710ec7661a34131523dc9608d8d01b268

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
