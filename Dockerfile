FROM ghcr.io/containerbase/base:14.14.6@sha256:e6208216dc6361995f3bca5b7c345b9be3e7723d45d311c6347376ff8adc8dd2

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
