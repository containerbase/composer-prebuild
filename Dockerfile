FROM ghcr.io/containerbase/base:13.25.13@sha256:d97321d342ba6318ae4e6700c6100e2bd6a8afc7aea2d93a35aa6166fa5a6438

# required to test composer
# renovate: datasource=github-releases packageName=containerbase/php-prebuild
RUN install-tool php 8.5.0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

ENV TOOL_NAME=composer

COPY bin /usr/local/bin

ARG DEBUG

RUN install-builder.sh
