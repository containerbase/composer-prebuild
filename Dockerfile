FROM ghcr.io/containerbase/base:14.59.4@sha256:88f18523902c357e23b9ec99996214e2aec1e79b49fb2fb0681819902f6b496a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
