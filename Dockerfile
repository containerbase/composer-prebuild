FROM ghcr.io/containerbase/base:13.18.2@sha256:0e415159aaf15a0f4b5809a7b233f5e462c4558e021d345f479ab350c459df34

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
