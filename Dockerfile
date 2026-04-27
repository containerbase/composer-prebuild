FROM ghcr.io/containerbase/base:14.9.4@sha256:e7163335fccb8825596664248137c6640d8ae086f5dbf8fe5b827dd96f763330

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
