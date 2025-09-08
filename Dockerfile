FROM ghcr.io/containerbase/base:13.10.19@sha256:b682e95b1929cf37678c4f70483e3788179f306ee1480518ce0c9dc37aee1a0a

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.12

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
