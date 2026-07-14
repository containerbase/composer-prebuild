FROM ghcr.io/containerbase/base:14.12.13@sha256:414e53adc7e5f816237ec7c4bd75ac01d4d374f8f44e00cc0d2996e76421deef

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
