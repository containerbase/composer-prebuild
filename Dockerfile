FROM ghcr.io/containerbase/base:14.56.1@sha256:fd71caad82ca393415902b4c7f294fc51668b8800524117ee75d5317dff52ee9

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
