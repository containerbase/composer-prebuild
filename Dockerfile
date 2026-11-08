FROM ghcr.io/containerbase/base:14.66.9@sha256:1311db3f04cbb4ff7e8c06468237872e9c1acea1ab6badc38f3e00dc9f931d67

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
