FROM ghcr.io/containerbase/base:11.6.2@sha256:285ea3019ed97bab5669753b7354ad4cd0a78be2f7e3d96fe24712dd12d85dfe

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
