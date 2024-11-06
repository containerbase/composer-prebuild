FROM ghcr.io/containerbase/base:13.0.9@sha256:7dea2662f0dc38887d055c9c588a84355d8db74f11a2d651e3cc32aee33f87f7

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
