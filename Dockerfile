FROM ghcr.io/containerbase/base:14.6.21@sha256:994ad45621589b8a96711db8a5dcaddae8d0d17931780c99bcdf65ba16dbe443

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
