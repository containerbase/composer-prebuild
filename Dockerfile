FROM ghcr.io/containerbase/base:14.4.2@sha256:433f589c69ccec80f503161a786df2c45f6247c36a8f8534f845b5bd37c29e1d

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.3

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
