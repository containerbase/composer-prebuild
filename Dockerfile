FROM ghcr.io/containerbase/base:14.10.8@sha256:43b66da1f303bcc8a3618c4995768e8aa16fdc824094c9cda509ecbb56a19cae

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.6

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
