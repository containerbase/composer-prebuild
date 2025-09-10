FROM ghcr.io/containerbase/base:13.10.21@sha256:19e1caafaa0c8f61f1c7cc65581cb16f8335af12f40ef1e47dff06958bbbabfb

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
