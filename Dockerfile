FROM ghcr.io/containerbase/base:13.8.51@sha256:4d0cd999085cd0aab45537b64de4453ec1612e56a5da9ec38be38ecef9ca3f92

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.10

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
