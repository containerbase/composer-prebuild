FROM ghcr.io/containerbase/base:14.26.1@sha256:668eccb6969c0a803764f7ee197a8c80f047e3e4e5bb554d46a64602804e2c6d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
