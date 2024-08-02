FROM ghcr.io/containerbase/base:11.6.5@sha256:e209ba382166e71516f4808779a58f1885c962c3740fdbb12b0627e6e502cae3

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
