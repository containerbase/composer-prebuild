FROM ghcr.io/containerbase/base:14.64.0@sha256:3c15a62b58c102aef3960a6f65bc97b269fa0f6981bbb119d4d1836cdfc3facc

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
