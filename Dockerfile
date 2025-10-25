FROM ghcr.io/containerbase/base:13.23.10@sha256:03cd965862ad066be8906e4b382aedf8758bcff1883b6be3ff1288f8058a200f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.14

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
