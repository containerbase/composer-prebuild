FROM ghcr.io/containerbase/base:13.7.11@sha256:692f1f18416793676b12e3836ade0a6dd4613fe8dd2e03c4e0fb760f304d055a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
