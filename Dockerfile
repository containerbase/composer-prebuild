FROM ghcr.io/containerbase/base:14.48.0@sha256:80c15165ed1c17cb8ad3a2ab91321d4b75997724e2820d4486ffa1dc9deadb2f

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
