FROM ghcr.io/containerbase/base:11.1.4@sha256:98b9f0ce07a9a628afd505b7e433c12c6cff8b2bfd0b94b5a68e3288b76e987b

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.3.9

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
