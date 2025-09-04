FROM ghcr.io/containerbase/base:13.10.15@sha256:0b643f9332464ab8203bb68512fbe1d7958cbe42b1919f6c0bdaa839121261a6

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
