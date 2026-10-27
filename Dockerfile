FROM ghcr.io/containerbase/base:14.54.0@sha256:0e3e7727d516cbbe7ac2c95121f3e0d5898ab6eab46345747562dd7666c94733

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
