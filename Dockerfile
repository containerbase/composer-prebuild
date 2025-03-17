FROM ghcr.io/containerbase/base:13.8.7@sha256:ba31dc44944a95c1263e6bf102b3ea799ca6c449db5e5ce83ff6f13802a46f1b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
