FROM ghcr.io/containerbase/base:14.29.1@sha256:6596d3e9d5655acc013f4b2c7bcb1c390281ccd230343de370fe8b206399f14d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
