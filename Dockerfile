FROM ghcr.io/containerbase/base:13.8.12@sha256:eaedf075151a1292ffaa158e035a771bfa376d27954e703749874b0634e0bc3c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
