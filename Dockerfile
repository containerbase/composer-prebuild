FROM ghcr.io/containerbase/base:11.3.0@sha256:2b13285e228ab0a4015da45fac3b374795457870bdb8029702c582cb6ecba326

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
