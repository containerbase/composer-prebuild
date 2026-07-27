FROM ghcr.io/containerbase/base:14.13.12@sha256:3d30cd7ec586567f9ed4b98570b485c9ddfe1e60019f0ab6cdf451677d1ca42b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
