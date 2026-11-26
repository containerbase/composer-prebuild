FROM ghcr.io/containerbase/base:15.0.1@sha256:e9730517acade74c851c6dce7c43f82a8a8e7bcc128b2c11ed1c01b34f2a31ce

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.6.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
