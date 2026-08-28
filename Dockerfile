FROM ghcr.io/containerbase/base:14.14.3@sha256:9db6ea7c03bf2717f79233a32b44274861210bac0891b89fc7fc01777aae0b65

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
