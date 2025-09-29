FROM ghcr.io/containerbase/base:13.14.4@sha256:fbfcb06e970a0990eb4dd5c1f6aa8fabbeab733d1472d7c12a3b25b1482e213b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
