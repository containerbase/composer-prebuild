FROM ghcr.io/containerbase/base:13.2.5@sha256:a260c3d038ade0072f0e7cf19f84960a49a2ac5007f2ff495dc9771db2ce6aac

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.1

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
