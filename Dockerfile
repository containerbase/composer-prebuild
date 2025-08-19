FROM ghcr.io/containerbase/base:13.10.7@sha256:0e7f67a6279b8236f83956a79486919c9d2d8dd9a0cd4867b9355044cda749e1

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.4.11

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
