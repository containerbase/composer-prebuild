FROM ghcr.io/containerbase/base:13.8.40@sha256:9556928ac9b00456572b549c1f870e771e1bf244649bf4d2110a16b0bbd2b7b5

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.8

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
