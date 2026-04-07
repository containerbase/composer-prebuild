FROM ghcr.io/containerbase/base:14.6.15@sha256:1f64cc9800aa391f863351b26e2365b395a7db937bef270aed09e0583860cc07

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.4

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
