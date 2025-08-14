FROM ghcr.io/containerbase/base:13.8.67@sha256:1ac3399609b01ec22d38295a146fa322782af587e00b3be34563911ad7817096

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
