FROM ghcr.io/containerbase/base:14.6.6@sha256:8430fc432cd49c6931ecbf36c7a45fdfc127c46228bd91d9feb62a64a5493eb2

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
