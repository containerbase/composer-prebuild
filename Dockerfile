FROM ghcr.io/containerbase/base:13.5.4@sha256:52778caebf07b8accafad75a4daa0363e291ccc7d6cad19bf17bc2dcf274302c

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.2

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
