FROM ghcr.io/containerbase/base:14.26.2@sha256:ea9ea0fe6807d290ab80509e48b9b414fa0867a04bcc7660c8775c3690c3b870

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
