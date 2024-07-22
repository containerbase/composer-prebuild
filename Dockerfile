FROM ghcr.io/containerbase/base:10.15.7@sha256:453d88617458453045308aeb3fb81231adf416c67c4180433d8dde5322b13ba7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
