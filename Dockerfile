FROM ghcr.io/containerbase/base:13.14.3@sha256:bf2c595e88888228e8410acc76001184cd729db25428524c9306c120693f73c0

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
