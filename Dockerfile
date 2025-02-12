FROM ghcr.io/containerbase/base:13.7.12@sha256:2196fac1d02596edc810f038146d9210d8f3ef67945308984652ea3a0a6f118a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
