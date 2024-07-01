FROM ghcr.io/containerbase/base:10.12.2@sha256:5422eb5b91e0b71a37c7623e1f8d768b277695e36e2ca67cdf0960615f3a7792

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
