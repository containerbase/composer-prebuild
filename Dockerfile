FROM ghcr.io/containerbase/base:13.17.1@sha256:f95b0fdfcd6ed2b90291be5ce97547ed005f6084d60784f7faeb3eb95f9873ed

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.13

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
