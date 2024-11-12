FROM ghcr.io/containerbase/base:13.0.15@sha256:fee1989906ed5dd6ca71ed199c647111cc0bcc8266481a35b8139334a0c46150

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
